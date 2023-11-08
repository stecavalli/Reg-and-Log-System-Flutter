 # Reg-and-Log-System-Flutter
Registration and Login System created with Flutter
 <br>
 <br>
The files provided in this repository can be used to create applications
 <br>
or games that require user registration and login. The data sent with
 <br>
registration is saved in a database and can be retrieved through login.
 <br>
This example can be applied on a hosting site that has PhpMyAdmin, 
 <br>
MySQL and Sendmail function such as altervista.org.
 <br>
The codes of the login.php, register.php and active.php files, which 
 <br>
 must be uploaded to the server, must be modified as indicated in each file.
 <br>
Software Versions Used:
 <br>
Android Studio Giraffe | 2022.3.1 Patch 2
<br>
Hosting site: altervista.org
 # Guide to creating and developing apps for the web and Android smartphones.
Open Android Studio and create a New Flutter Project by clicking on the
 <br>
appropriate button which will start the wizard.
 <br>
Copy the codes from the main.dart and pubspec.yaml files and paste them into
 <br>
the respective files in your Flutter project.
 <br>
Edit the lines of code within the main.dart file where indicated by the two comments.
 <br>
Remember to change the name inside the pubspec.yaml file and the label inside
 <br>
the AndroidManifest.xml file if you have called your project with a name other than "database".
 <br>
The Android Manifest XML file that is generated, when you create a new
 <br>
Flutter project with Android Studio, is located in the path
 <br>
YOUR_APPLICATION_FOLDER\android\app\src\main\AndroidManifest.xml.
 <br>
To this file you need to add the following lines of code:
 <br>
<uses-permission android:name="android.permission.INTERNET"/>
 <br>
android:usesCleartextTraffic="true"
<img src="https://raw.githubusercontent.com/stecavalliofficial/Muscle-Car-Unity-Package/main/Muscle%20Car%20-%20Race%20Track.jpg" alt="Muscle Car">
 <br>
as shown in the AndroidManifestXml_LOCATION_AND_LINES_TO_ADD.png image
 <br>
found in this repository.
