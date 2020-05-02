import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

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
  Stream<QuerySnapshot> getEvents() {
    return _db.collection('Events').snapshots();
  }

  /* Spesifimpi versio. Etsii kansalaisen Larry ja ottaa hänen henkilönkohtaiset tapahtumansa streamina*/
  Stream<QuerySnapshot> getSpecifiedEvents() {
    return _db
        .collection('Citizen')
        .document('Larry')
        .collection('personalEvents')
        .snapshots();
  }

  // Haetaan kaikki apupalveluilmoitukset
  Stream<QuerySnapshot> getHelps() {
    return _db.collection('Services')
        .document('Helper')
        .collection('Service')
        .document('Receiver')
        .collection('HelpRequest')
        .snapshots();
  }

   Future<void> helpSignUp(user)async {
      await _db.collection("Services")
      .document('Helper')
      .collection('Service')
      .document('Helper')
      .collection('Helpers')
      .add(
       {
       'user':user,
      }
  );
  }
  

    Stream<QuerySnapshot> getHealth(){
    return _db.collection('Terveys').where('reserved', isEqualTo: false).snapshots();
  }

  // Palauttaa spesifin collectionin
  Stream<QuerySnapshot> getCollection(String collection) {
    return _db.collection(collection).snapshots();
  }

  //Jos haluat yksittäisen dokumentin tiedot käytä DocumentSnapshottia.
  Stream<DocumentSnapshot> getDocument(String document) {
    return _db.document(document).snapshots();
  }

  //En mä löydä sitä dokkarii mitä mun pitäis. Mitä teen. Where auttaa
  Stream<QuerySnapshot> getCitizenByName(String nimi) {
    return _db
        .collection('kaupunkilainen')
        .where('nimi', isEqualTo: nimi)
        .snapshots();
  }

  Stream<QuerySnapshot> getHelpByCategory(String category) {
    return _db
        .collection('Services')
        .document('Helper')
        .collection('Service')
        .document('Receiver')
        .collection('HelpRequest')
        .where('type', isEqualTo: category)
        .snapshots();
  }

  // Päivitetään dokkaria ID:n perusteella.
  Future<void> updateData(String collection, String documentId, String nimi,
      String ika, Timestamp date) async {
    await _db.collection(collection).document(documentId).updateData({
      'nimi': nimi,
      'ikä': ika,
      'tili luotu': date,
    });
  }

// Poistetaan fieldi
  Future<void> deleteValue(
      String collection, String documentId, String value) async {
    await _db.collection(collection).document(documentId).updateData({
      'palvelut.terveydenhuolto': FieldValue.arrayRemove([value])
    });
  }

// Tallennetaan jotain kivaa
  Future<void> saveNewValue(
      String collection, String documentID, String value) async {
    await _db.collection(collection).document(documentID).updateData({
      'palvelut.terveydenhuolto': FieldValue.arrayUnion([value]),
    });
  }

/* Päivittää jonkun tietyn objektin numeraalista arvoa, ottaa tuoreimman arvon snapshottina ennen päivitystä (Varmasti tarkka)
Jos päivität tekstikenttää tätä ei tietenkään tarvita, 
lähinnä vaan tarpeellinen esim, Jonkun tapahtuman/postauksen tykkäysten määrän päivitykseen */
  void updateValue(String document, int value, DocumentReference ref) {
    _db.runTransaction((transaction) async {
      try {
        DocumentSnapshot freshSnap = await transaction.get(ref);
        await transaction.update(freshSnap.reference, {
          document: freshSnap[document] + value,
        });
      } catch (_) {
        throw Exception('Me no like!');
      }
    });
  }

  /* Spesifimpi versio. Etsii kansalaisen Larry ja ottaa hänen henkilönkohtaiset tapahtumansa streamina*/
  Stream<DocumentSnapshot> getUserData({user}) {
    return _db.collection('users').document(user.uid).snapshots();
  }

  Future<DocumentSnapshot> getUserDataReference({user}) {
    print("$user in snapshot");
    return _db.collection('users').document(user.uid).get();
  }

  //Test
  Future<QuerySnapshot> getUsersWithCommunitiesReference() {
    return _db
        .collection("services")
        .where("community", arrayContains: "Carpool")
        .getDocuments();
  }

  //Test 2
  Future<QuerySnapshot> getUsersWithCommunitiesReference2() {
    return _db
        .collection("users")
        .document("services")
        .collection("services")
        .where("community", arrayContains: "Marketplace")
        .getDocuments();
  }

  // get citizenpoints
  Future<DocumentSnapshot> getUserCitizenpoints({user}) {
    return _db.collection("users").document(user).get();
  }

  //Haluan luoda uuden Documentin tyhjästä. Teen sen näin.
  Map<String, dynamic> buildProfile(
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
      DateTime birthday,
      List<String> selectedHealthcare,
      List<String> selectedCommunity,
      List<String> selectedCommunityAreas,
      List<String> selectedHelp,
      List<String> selectedHelpAreas,
      List<String> selectedEvents,
      List<String> selectedEventAreas,
      String other,
      bool securitySelected) {
    //Profile
    Map<String, dynamic> profDoc = Map<String, dynamic>();
    profDoc['fname'] = fName;
    profDoc['lname'] = lName;
    //profDoc['services'] = profileCollection;
    profDoc['birthday'] = birthday;
    profDoc['address'] = address;
    profDoc['postal code'] = postalAddress;
    profDoc['area'] = area;
    profDoc['email'] = email;
    profDoc['beacon activated'] = beaconIsSelected;
    profDoc['security survailance'] = securitySelected;
    profDoc['special health condition'] = healthcareSelected;
    profDoc['other medical condition'] = other;
    profDoc['community services'] = communitySelected;
    profDoc['help services'] = helpSelected;
    profDoc['events selected'] = eventSelected;
    profDoc['UI'] = uiSelected;
    profDoc['notifications'] = notificationsSelected;
    profDoc['citizenpoints'] = 0;
    //Listed services
    profDoc['healthcare'] = selectedHealthcare;
    profDoc['community'] = selectedCommunity;
    profDoc['community areas'] = selectedCommunityAreas;
    profDoc['help'] = selectedHelp;
    profDoc['help areas'] = selectedHelpAreas;
    profDoc['events'] = selectedEvents;
    profDoc['event areas'] = selectedEventAreas;

    return profDoc;
  }

  // Luodaan valitun collectionin alle uusi document.
  Future<void> createProfile(String user, Map profile) async {
    await _db.collection("users").document(user).setData(profile);
  }

  factory Database() => _instance;

  void newCommunityPost({
    @required Map<String, dynamic> post,
    @required String document,
    @required String collection,
    @required Function callback,
  }) async {
    await _db
        .collection('Services')
        .document('Community')
        .collection('Service')
        .document(document)
        .collection(collection)
        .add(post)
        .then((onValue) => callback != null
            ? callback(onValue, false)
            : print("callback not defined."))
        .catchError((onError) => {callback(null, true)});
  }

    void newHelperPost({
    @required Map<String, dynamic> post,
    @required String document,
    @required String collection,
    @required Function callback,
  }) async {
    await _db
        .collection('Services')
        .document('Helper')
        .collection('Service')
        .document(document)
        .collection(collection)
        .add(post)
        .then((onValue) => callback != null
            ? callback(onValue, false)
            : print("callback not defined."))
        .catchError((onError) => {callback(null, true)});
  }

  // All specified community posts. Document should be either: "Marketplace" or "Carpool"
  // -- collection should specify which trading method: Trading.toDatabaseCollectionId().
  Future<QuerySnapshot> getCommunityPosts({
    @required String document,
    @required String collection,
  }) {
    return _db
        .collection('Services')
        .document('Community')
        .collection('Service')
        .document(document)
        .collection(collection)
        .getDocuments();
  }

  Future<void> updateCitizenpoints({user, citizenpoints}) async {
    await _db.collection("users").document(user).updateData({
      'citizenpoints': FieldValue.increment(citizenpoints),
    });
  }

   Future<void> reserveHealth(document,user)async {
      await _db.collection("Terveys").document(document).updateData(
       {'reserved':true,
       'user':user,
      }
  );
  }
}
