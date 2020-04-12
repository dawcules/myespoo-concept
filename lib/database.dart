//import 'package:fb_auth/fb_auth.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Database {
  Database._internal();  
  static final Database _instance = Database._internal();
  final Firestore _db = Firestore.instance;

/*
  final _app = FbApp(
    apiKey: " AIzaSyCrYqY8optvP8lHc3D-iK24YNYo6mkgkZI",
    authDomain: "localhost",
    databaseURL: "https://cityprog-24974.firebaseio.com/",
    projectId: "cityprog-24974",
    storageBucket: "gs://cityprog-24974.appspot.com/");
  AuthBloc _auth;
  StreamSubscription<AuthUser> _userChanged;
*/

  /*
  Collection = Kokoelma documentteja
  Document = yksittäinen Dokumentti(objekti) jolla voi olla omia Kokoelmia sekä Fieldejä(attribuutteja, key: value)
  */

  /* Jokainen event streamataan firestoresta, QuerySnapshot pitää sisällään koko collectionin.
  Käytä tätä StreamBuilder widgetin kanssa näyttääksesi dynaamisen listan (jonka voi sitten pistää listviewiin jne..)*/
  Stream<QuerySnapshot> getEvents(){
    return _db.collection('Events').snapshots();
  }

  /* Spesifimpi versio. Etsii kansalaisen Larry ja ottaa hänen henkilönkohtaiset tapahtumansa streamina*/
  Stream<QuerySnapshot> getSpecifiedEvents(){
    return _db.collection('Citizen').document('Larry').collection('personalEvents').snapshots();
  }

  // Palauttaa spesifin collectionin
 Stream<QuerySnapshot> getCollection(String collection){
    return _db.collection(collection).snapshots();
  }
  //Jos haluat yksittäisen dokumentin tiedot käytä DocumentSnapshottia.
  Stream<DocumentSnapshot> getDocument(String document){
    return _db.document(document).snapshots();
  }
  /* Päivittää jonkun tietyn objektin numeraalista arvoa, ottaa tuoreimman arvon snapshottina ennen päivitystä (Varmasti tarkka)
  Jos päivität tekstikenttää tätä ei tietenkään tarvita, 
  lähinnä vaan tarpeellinen esim, Jonkun tapahtuman/postauksen tykkäysten määrän päivitykseen */
  void updateValue(String document, int value, DocumentReference ref){
    _db.runTransaction((transaction) async {
        try{
            DocumentSnapshot freshSnap = await transaction.get(ref);
            await transaction.update(freshSnap.reference, {
              document: freshSnap[document] + value,
            });
        }
          catch (_) {
             throw Exception('Me no like!');
        }
    });
  }

  //Haluan luoda uuden Documentin tyhjästä. Teen sen näin.
  Map<String,dynamic> buildDocument() {

    //Initializing the Alicollection jos sellanen halutaan. 
    Map<String, List<String>> innerCollection = new Map<String, List<String>>();
    innerCollection['kirjasto'] = [];
    innerCollection['terveydenhuolto'] = [];
    innerCollection['kela'] = [];

    //Pää Doc
    Map<String, dynamic> mainDoc = Map<String, dynamic>();
    mainDoc['nimi'] = '';
    mainDoc['palvelut'] = innerCollection;
    mainDoc['ikä'] = '';
    mainDoc['muuta'] = '';

    return mainDoc;
  }
  // Luodaan valitun collectionin alle uusi document.
 Future<void> createDocument(String collection, Map<String, dynamic> newDoc) async {
        await _db.collection(collection).document().setData(newDoc); 
  }

  //En mä löydä sitä dokkarii mitä mun pitäis. Mitä teen. Where auttaa
  Stream<QuerySnapshot> getDeviceName(String nimi) {
  return _db.collection('kaupunkilainen').where('nimi', isEqualTo: nimi).snapshots();
  }

  


  factory Database() => _instance;
}

class CreateDocument {

   
 
  
}