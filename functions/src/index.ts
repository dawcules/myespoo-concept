import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
//import { snapshotConstructor } from 'firebase-functions/lib/providers/firestore';
admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
const db = admin.firestore();
const fcm = admin.messaging();
/*
export const sendToTapahtumat = functions.firestore
.document("Tapahtumat/{TapahtumatID}")
.onCreate(async snapshot => {
  const event = snapshot.data();
  if(event){
  const payload: admin.messaging.MessagingPayload = {
    notification:{
      title: "new Event Added!",
      body: `New event randomly appeared! Named ${event.nameEN ? event.nameEN : null}`,
      //icon
      clickAction: 'FLUTTER_NOTIFICATION_CLICK',
    }
  }
  return fcm.sendToTopic("Tapahtumat", payload);
}
  return null;
},);
*/
export const sendToImportant = functions.firestore
.document("Important/{ImportantID}")
.onCreate(async snapshot => {
  const important = snapshot.data();
  if(important){
  const payload: admin.messaging.MessagingPayload = {
    notification:{
      title: `Tärkeää: ${important.nameFI ? important.nameFI : null}`,
      body: `${important.bodyFI ? important.bodyFI : null}`,
      //icon
      clickAction: 'FLUTTER_NOTIFICATION_CLICK',
    }
  }
  return fcm.sendToTopic("Important", payload);
}
  return null;
},);

export const sendToPublic = functions.firestore
.document("PublicEvents/{PublicEventsID}")
.onCreate(async snapshot => {
  const publicEvent = snapshot.data();
  if(publicEvent){
  const payload: admin.messaging.MessagingPayload = {
    notification:{
      title: `Yleistä: ${publicEvent.nameFI ? publicEvent.nameFI : null}`,
      body: `${publicEvent.bodyFI ? publicEvent.bodyFI : null}`,
      //icon
      clickAction: 'FLUTTER_NOTIFICATION_CLICK',
    }
  }
  return fcm.sendToTopic("PublicEvents", payload);
}
  return null;
},);

export const sendToLocation = functions.firestore
.document("Location/{LocationID}")
.onCreate(async snapshot => {
  const location = snapshot.data();
  if(location){
  const payload: admin.messaging.MessagingPayload = {
    notification:{
      title: `Alueella: ${location.nameFI ? location.nameFI : null}`,
      body: `${location.bodyFI ? location.bodyFI : null}`,
      //icon
      clickAction: 'FLUTTER_NOTIFICATION_CLICK',
    }
  }
  return fcm.sendToTopic("Location", payload);
}
  return null;
},);



export const sendToUsersInArea = functions.firestore.document("Ilmoitukset/{IlmoituksetID}")
  .onCreate(async snapshot => {

    const ilmoitus = snapshot.data();
    if(ilmoitus){

    await db.collection("users").where("area", "==" , ilmoitus.area).get()
    .then(async userSnapshot => {
    userSnapshot.forEach(async user => {
      const userInAreaSnapshot = await db
      .collection('users')
      .doc(user.id)
      .collection('tokens')
      .get();

    const tokens = userInAreaSnapshot.docs.map(snap => snap.id);
    const payload: admin.messaging.MessagingPayload = {
      notification: {
        title: "Alueilmoitus",
        body: `Alueella ${ilmoitus.area} ${ilmoitus.contentFI} aikavälillä: ${ilmoitus.start} -> ${ilmoitus.end}`,
        icon: 'your-icon-url',
        click_action: 'FLUTTER_NOTIFICATION_CLICK'
      }
    };
    if(tokens){
      return fcm.sendToDevice(tokens, payload);}
    else{
      console.log("No tokens")
      return null ;}
  })})
  return null;
}
return null;
});

export const lookingForCarpoolInArea = functions.firestore
.document("Services/Community/Service/Carpool/Offering/{OfferingID}")
.onCreate(async snapshot => {

  const offering = snapshot.data();
  console.log(offering);

  if(offering){ 
        await db.collection("users").where("community","array-contains", "Carpool").get()
        .then(async userInCarpoolSnapshot => {
          userInCarpoolSnapshot.forEach(async user => {
            console.log(user);
            console.log(user.id);
            const userTokenSnapshot = await db
            .collection('users')
            .doc(user.id)
            .collection('tokens')
            .get();      
      const tokens = userTokenSnapshot.docs.map(snap => snap.id);
      const payload: admin.messaging.MessagingPayload = {
        notification: {
          title: "Kimppakyyti tarjolla!",
          body: `Käyttäjä ${offering.user} , tarjoaa kimppakyytiä alueille ${offering.areas[0]} ja ${offering.areas[1]} aikaan: ${offering.timeOfDay}`,
          icon: 'your-icon-url',
          click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
      }
      if(tokens){
        return fcm.sendToDevice(tokens, payload);}
        else{
          console.log("No tokens")
          return null;}
    });
         
    });
   
  }
  return null;
});

//${user.get('fName')} ${user.get('lName')}
export const newItemInMarket = functions.firestore
.document("Services/Community/Service/Marketplace/Selling/{SellingID}")
.onCreate(async snapshot => {

  const selling = snapshot.data();
  console.log(selling);

  if(selling){ 
        await db.collection("users").where("community","array-contains", "Marketplace").get()
        .then(async userInCarpoolSnapshot => {
          userInCarpoolSnapshot.forEach(async user => {
            console.log(user);
            console.log(user.id);
            const userTokenSnapshot = await db
            .collection('users')
            .doc(user.id)
            .collection('tokens')
            .get();      
      const tokens = userTokenSnapshot.docs.map(snap => snap.id);
      const payload: admin.messaging.MessagingPayload = {
        notification: {
          title: `Uusi tavara marketissa: ${selling.title}`,
          body: `Käyttäjä ${selling.user} , tarjoaa tuotetta ${selling.title} kuvauksella: ${selling.body} hintaan: ${selling.price} alueella: ${selling.area}`,
          icon: 'your-icon-url',
          click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
      }
      if(tokens){
        return fcm.sendToDevice(tokens, payload);}
        else{
          console.log("No tokens")
          return null;}
    });
         
    });
   
  }
  return null;
});


/*
export const HelpServicesInArea = functions.firestore
.document("Services/Helper/Service/Carpool/Offering/{OfferingID}")
.onCreate(async snapshot => {

  const offering = snapshot.data();
  console.log(offering);

  if(offering){ 
        await db.collection("users").where("community","array-contains", "Carpool").get()
        .then(async userInCarpoolSnapshot => {
          userInCarpoolSnapshot.forEach(async user => {
            const userTokenSnapshot = await db
            .collection('users')
            .doc(user.id)
            .collection('tokens')
            .get();      
      const tokens = userTokenSnapshot.docs.map(snap => snap.id);
      const payload: admin.messaging.MessagingPayload = {
        notification: {
          title: "Kimppakyyti tarjolla!",
          body: `Käyttäjä ${offering.user} , tarjoaa kimppakyytiä alueille ${offering.areas[0]} ja ${offering.areas[1]} aikaan: ${offering.timeOfDay}`,
          icon: 'your-icon-url',
          click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
      }
      if(tokens){
        return fcm.sendToDevice(tokens, payload);}
        else{return console.log("No tokens");}
    });
         
    });
   
  }
  return null;
});
*/
/*
export const sendToDevice = functions.firestore
  .document('orders/{orderId}')
  .onCreate(async snapshot => {


    const order = snapshot.data();

    const querySnapshot = await db
      .collection('users')
      .doc(order.seller)
      .collection('tokens')
      .get();

    const tokens = querySnapshot.docs.map(snap => snap.id);

    const payload: admin.messaging.MessagingPayload = {
      notification: {
        title: 'New Order!',
        body: `you sold a ${order.product} for ${order.total}`,
        icon: 'your-icon-url',
        click_action: 'FLUTTER_NOTIFICATION_CLICK'
      }
    };

    return fcm.sendToDevice(tokens, payload);
  });

*/
export const helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});
