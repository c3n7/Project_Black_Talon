# Project Black Talon
[![codecov](https://codecov.io/gh/c3n7/Project_Black_Talon/branch/master/graph/badge.svg)](https://codecov.io/gh/c3n7/Project_Black_Talon) [![Build Status](https://travis-ci.com/c3n7/Project_Black_Talon.svg?branch=master)](https://travis-ci.com/c3n7/Project_Black_Talon)

- A gate check-in system developed using Flutter.

## Web
- Go to the firebase console, in your project, add the web platform
- Create `web/firebaseconfig.js` and paste the `firebaseConfig` variable shown in the wizard there:
  ```javascript
  var firebaseConfig = {
    apiKey: "api-key",
    authDomain: "project-id.firebaseapp.com",
    databaseURL: "https://project-id.firebaseio.com",
    projectId: "project-id",
    storageBucket: "project-id.appspot.com",
    messagingSenderId: "sender-id",
    appId: "app-id",
    measurementId: "G-measurement-id",
  };
  ```
- In the future, you may need to update these links in `web/index.html` to newer versions:
  ```html
  <!-- The core Firebase JS SDK is always required and must be listed first -->
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-app.js"></script>

  <!-- TODO: Add SDKs for Firebase products that you want to use
   https://firebase.google.com/docs/web/setup#available-libraries -->
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-analytics.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-auth.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-firestore.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-functions.js"></script>
  ```
