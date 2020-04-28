import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
//import { snapshotConstructor } from 'firebase-functions/lib/providers/firestore';
admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
//const db = admin.firestore();
const fcm = admin.messaging();

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

export const sendToImportant = functions.firestore
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


/*
export const sendToDevicce = functions.firestore.document("Something here").onCreate(async snapshot => {
  const myballs = snapshot.data();

  const querySnapshot = await db
  .collection("users")
  .doc("someone offering a ride for example")
  .collection("tokens")
  .get();


});
*/


export const helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});
