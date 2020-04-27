import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
//const db = admin.firestore();
const fcm = admin.messaging();

export const sendToTopic = functions.firestore
.document("Tapahtumat/{TapahtumatID}")
.onCreate(async snapshot => {
  const event = snapshot.data();
  if(event){
  const payload: admin.messaging.MessagingPayload = {
    notification:{
      title: "new Event Added!",
      body: `New event randomly appeared! Named ${event.nameEN ? null : event.nameEN}`,
      //icon
      clickAction: 'FLUTTER_NOTIFICATION_CLICK',
    }
  }
  return fcm.sendToTopic("Tapahtumat", payload);
}
  return null;
},);



export const helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});
