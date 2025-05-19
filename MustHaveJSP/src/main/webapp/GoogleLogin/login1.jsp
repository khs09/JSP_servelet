<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Google Login #1</title>
</head>
<body>
<script src="https://accounts.google.com/gsi/client" async></script>
    <script>
      function handleCredentialResponse(response) {
        var responsePayload = jwt+decode(resonse.credential);
        console.log(responsePayload);
        console.log("ID : " responsePayload.sub);
        console.log("Full Name : " responsePayload.name);
        console.log("Given Name : " responsePayload.given_name);
        console.log("Family Name : " responsePayload.family_name);
        console.log("Image URL : " responsePayload.picture);
        console.log("Email : " responsePayload.email);

      }
      window.onload = function () {
        google.accounts.id.initialize({
          client_id: "132407704599-vjul657keh8o7bq1hjb0pg6n7m4r8090.apps.googleusercontent.com"
          callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
          document.getElementById("buttonDiv"),
          { theme: "outline", size: "large" }  // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
      }
    </script>
    <div id="buttonDiv"></div>
</body>
</html>