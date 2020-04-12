      
      // Your web app's Firebase configuration
      importScripts('https://www.gstatic.com/firebasejs/7.12.0/firebase-app.js');
      importScripts('https://www.gstatic.com/firebasejs/7.12.0/firebase-messaging.js');
      
      const messaging = firebase.messaging();

      messaging.requestPermission().then(function() {
     //getToken(messaging);
     return messaging.getToken();
    }).then(function(token){
    console.log(token);
    })
    .catch(function(err) {
    console.log('Permission denied', err);
    });

        messaging.onMessage((payload) => {
        console.log('Message received. ', payload);
    // ...
    });
