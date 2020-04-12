      // Your web app's Firebase configuration

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