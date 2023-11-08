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
 <br>
This example can be applied on a hosting site that has PhpMyAdmin, 
 <br>
MySQL and Sendmail function such as altervista.org.
 <br>
The codes of the <b>login.php</b>, <b>register.php</b> and <b>active.php</b> files, which 
 <br>
 must be uploaded to the server, must be modified as indicated in each file.
 <br>
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
 <br>
Copy the codes from the <b>main.dart</b> and <b>pubspec.yaml</b> files and paste them into
 <br>
the respective files in your Flutter project.
 <br>
 <br>
Edit the lines of code within the <b>main.dart</b> file where indicated by the two comments.
 <br>
Remember to change the name inside the <b>pubspec.yaml</b> file and the label inside
 <br>
the <b>AndroidManifest.xml</b> file if you have called your project with a name other than "database".
 <br>
 <br>
The Android Manifest XML file that is generated, when you create a new
 <br>
Flutter project with Android Studio, is located in the path
 <br>
YOUR_APPLICATION_FOLDER\android\app\src\main\AndroidManifest.xml.
 <br>
 <br>
To this file you need to add the following lines of code:
 <br>
\<uses-permission android:name="android.permission.INTERNET"/\>
 <br>
android:usesCleartextTraffic="true"
 <br>
as shown in the AndroidManifestXml_LOCATION_AND_LINES_TO_ADD.png image
 <br>
found in this repository.
 <br>
 <br>
<img src="screen_app_android_1.png" alt="screen android 1" width="200" height="424">
<img src="screen_app_android_2.png" alt="screen android 1" width="200" height="424">
