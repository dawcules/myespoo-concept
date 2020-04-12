importScripts('https://www.gstatic.com/firebasejs/7.12.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/7.12.0/firebase-messaging.js');

const firebaseConfig = {
    apiKey: "AIzaSyAtHq48TkTxtFgCO_OvyNCS10QFWr2rXBo",
    authDomain: "cityprog-24974.firebaseapp.com",
    databaseURL: "https://cityprog-24974.firebaseio.com",
    projectId: "cityprog-24974",
    storageBucket: "cityprog-24974.appspot.com",
    messagingSenderId: "1044301582240",
    appId: "1:1044301582240:web:d33b1fc254ef328de6dec5",
    measurementId: "G-QXEVDNCDP8"
  };

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();
