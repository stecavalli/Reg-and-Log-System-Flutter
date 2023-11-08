import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final bool _visible = false;

  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  String text_1 = "Server response";
  String text_2 = "Do not have an account? Sign Up!";

  Future<void> senddata() async {
    try {
      final response = await http.post(
        Uri.parse("http://YOUR-SUBDOMAIN-NAME.altervista.org/login.php"),  // Edit this line by inserting the web address or IP address of the HTTP/WEB server used
        body: {
          "name": firstname.text,
          "lastname": lastname.text,
          "mail": mail.text,
          "username": username.text,
          "password": password.text,
        },
      );

      if (kDebugMode) {
        print("Response Body: ${response.body}");
      }

      if (response.statusCode == 200) {
        String responseServer = response.body;
        setState(() {
          text_1 = responseServer;
        });
      } else {
        setState(() {
          text_1 = "Error during HTTP request: ${response.statusCode}";
        });
        throw Exception('Error during HTTP request: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      setState(() {
        text_1 = "Unexpected error: $e";
      });
      //rethrow;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: _visible,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const LinearProgressIndicator(),
                  ),
                ),
                Container(
                  height: 100.0,
                ),
                Icon(
                  Icons.group,
                  color: Theme.of(context).primaryColor,
                  size: 80.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5),
                          ),
                          child: TextFormField(
                            controller: username,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter Username',
                              prefixIcon: Icon(
                                Icons.person_pin_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Username',
                            ),
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Username';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5),
                          ),
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter Password',
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () =>
                            {
                              if (_formKey.currentState!.validate()) {
                                senddata()
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme
                                      .of(context)
                                      .primaryColor),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 160.0,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.lightGreen.shade500
                                ],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 10.0),
                                )
                              ]),
                          child: Center(
                            child: Text(
                              text_1,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              const RegisterFormPage()),
                            );
                          },
                          child: Text(
                            text_2,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue.shade900,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class RegisterFormPage extends StatelessWidget {
  const RegisterFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final bool _visible = false;

  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  String text_1 = "Server response";

  Future<void> senddata() async {
    try {
      final response = await http.post(
        Uri.parse("http://YOUR-SUBDOMAIN-NAME.altervista.org/registrazione.php"),   // Edit this line by inserting the web address or IP address of the HTTP/WEB server used
        body: {
          "name": firstname.text,
          "lastname": lastname.text,
          "mail": mail.text,
          "username": username.text,
          "password": password.text,
        },
      );

      if (kDebugMode) {
        print("Response Body: ${response.body}");
      }

      if (response.statusCode == 200) {
        String responseServer = response.body;
        setState(() {
          text_1 = responseServer;
        });
      } else {
        setState(() {
          text_1 = "Error during HTTP request: ${response.statusCode}";
        });
        throw Exception('Error during HTTP request: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      setState(() {
        text_1 = "Unexpected error: $e";
      });
      //rethrow;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: _visible,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const LinearProgressIndicator(),
                  ),
                ),
                Container(
                  height: 82.0,
                ),
                Icon(
                  Icons.group,
                  color: Theme.of(context).primaryColor,
                  size: 80.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5),
                          ),
                          child: TextFormField(
                            controller: firstname,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter First Name',
                              prefixIcon: Icon(
                                Icons.person_outline_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'First Name',
                            ),
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter First Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5),
                          ),
                          child: TextFormField(
                            controller: lastname,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter Last Name',
                              prefixIcon: Icon(
                                Icons.person_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Last Name',
                            ),
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Last Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5),
                          ),
                          child: TextFormField(
                            controller: mail,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter E-Mail Address',
                              prefixIcon: Icon(
                                Icons.mail_outline_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              hintText: 'E-Mail Address',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter E-Mail Address';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5),
                          ),
                          child: TextFormField(
                            controller: username,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter Username',
                              prefixIcon: Icon(
                                Icons.person_pin_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Username',
                            ),
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Username';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: const Color.fromRGBO(84, 87, 90,
                                0.5),
                            hintColor:
                            const Color.fromRGBO(84, 87, 90,
                                0.5), //placeholder color
                          ),
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter Password',
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () =>
                            {
                              if (_formKey.currentState!.validate()) {
                                senddata()
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme
                                      .of(context)
                                      .primaryColor),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.lightGreen.shade500
                                ],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 10.0),
                                )
                              ]),
                          child: Center(
                            child: Text(
                              text_1,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}