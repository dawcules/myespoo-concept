import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Database {
  Database._internal();  
  static final Database _instance = Database._internal();
  final Firestore _db = Firestore.instance;

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

  // Haetaan kaikki apupalveluilmoitukset
  Stream<QuerySnapshot> getHelps(){
    return _db.collection('Events').snapshots();
  }

  // Palauttaa spesifin collectionin
 Stream<QuerySnapshot> getCollection(String collection){
    return _db.collection(collection).snapshots();
  }

  //Jos haluat yksittäisen dokumentin tiedot käytä DocumentSnapshottia.
  Stream<DocumentSnapshot> getDocument(String document){
    return _db.document(document).snapshots();
  }

  //En mä löydä sitä dokkarii mitä mun pitäis. Mitä teen. Where auttaa
  Stream<QuerySnapshot> getCitizenByName(String nimi) {
  return _db.collection('kaupunkilainen').where('nimi', isEqualTo: nimi).snapshots();
  }
   Stream<QuerySnapshot> getHelpByCategory(String category) {
  return _db.collection('Apupalvelu').where('type', isEqualTo: category).snapshots();
  }

  // Päivitetään dokkaria ID:n perusteella.
  Future<void> updateData(String collection , String documentId, String nimi, String ika, Timestamp date) async {
  await _db.collection(collection).document(documentId).updateData(
      {'nimi': nimi,
        'ikä': ika,
        'tili luotu': date,
      }
  );
}

// Poistetaan fieldi
Future<void> deleteValue(String collection, String documentId, String value) async {
  await _db.collection(collection).document(documentId).updateData({'palvelut.terveydenhuolto': FieldValue.arrayRemove([value])});
}

// Tallennetaan jotain kivaa
Future<void> saveNewValue(String collection, String documentID, String value) async {
  await _db.collection(collection).document(documentID).updateData(
      {'palvelut.terveydenhuolto': FieldValue.arrayUnion([value]),
      }
  );
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

Map<String,dynamic> buildProfile(
  bool beaconIsSelected,
  bool healthcareSelected,
  bool communitySelected, 
  bool helpSelected, 
  bool eventSelected, 
  bool uiSelected, 
  bool notificationsSelected,

  String email,
  String address,
  String fName,
  String lName,
  String postalAddress,
  String area,
  String birthday,

  List<String> selectedHealthcare,

  List<String> selectedCommunity,
  List<String> selectedCommunityAreas,

  List<String> selectedHelp,
  List<String> selectedHelpAreas,

  List<String> selectedEvents,
  List<String> selectedEventAreas,
) {

    //Listed services
    Map<String, List<String>> profileCollection = new Map<String, List<String>>();
    profileCollection['healthcare'] = selectedHealthcare;
    profileCollection['community'] = selectedCommunity;
    profileCollection['community areas'] = selectedCommunityAreas;
    profileCollection['help'] = selectedHelp;
    profileCollection['help areas'] = selectedHelpAreas;
    profileCollection['events'] = selectedEvents;
    profileCollection['event areas'] = selectedEventAreas;

    //Profile
    Map<String, dynamic> profDoc = Map<String, dynamic>();
    profDoc['fname'] = fName;
    profDoc['lname'] = lName;
    profDoc['services'] = profileCollection;
    profDoc['birthday'] = birthday;
    profDoc['address'] = address;
    profDoc['postal code'] = postalAddress;
    profDoc['area'] = area;
    profDoc['email'] = email;
    profDoc['beacon activated'] = beaconIsSelected.toString();
    profDoc['special health condition'] = healthcareSelected.toString();
    profDoc['community services'] = communitySelected.toString();
    profDoc['help services'] = helpSelected.toString();
    profDoc['events selected'] = eventSelected.toString();
    profDoc['UI'] = uiSelected.toString();
    profDoc['notifications'] = notificationsSelected.toString();
    return profDoc;
  }
  // Luodaan valitun collectionin alle uusi document. 
Future<void> createProfile(String user, Map<String, dynamic> profile) async {
        await _db.collection("users").document(user).setData(profile); 
}


  factory Database() => _instance;

  // Carpool postin lisääminen. tradeMethod == Trading.toLocalizedString()
  // Callback funktioon lähetetään tieto mahdollisista virheistä.
  void newCarpoolPost(
      Map<String, dynamic> post, String tradeMethod, Function callback) async {
    await _db
        .collection('Services')
        .document('Community')
        .collection('Service')
        .document('Carpool')
        .collection(tradeMethod)
        .add(post)
        .then((onValue) => callback(onValue, false))
        .catchError((onError) => {callback(null, true)});
  }
}