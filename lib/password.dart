import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'firebase_options.dart';

class MyPassword extends StatefulWidget {
  const MyPassword({super.key});

  @override
  State<MyPassword> createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/1.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 85),
            ),
            SingleChildScrollView(
              child: FutureBuilder(
                future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.5,
                            right: 35,
                            left: 35),
                        child: Column(
                          children: [
                            TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    'Email                                         @mlrit.ac.in',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: _password,
                              obscureText: true,
                              enableSuggestions: false,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Create Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            /*TextField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),*/
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: getButtonStyle(327, 50),
                                  onPressed: () async {
                                    final email = _email.text;
                                    final password = _password.text;
                                    try {
                                      final userCredential = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password);
                                      Navigator.pushReplacementNamed(
                                          context, 'homepage');
                                      print(userCredential);
                                    } on FirebaseAuthException catch (e) {
                                      String errorMessage = '';
                                      if (e.code == 'weak-password') {
                                        errorMessage = 'weak password';
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        errorMessage =
                                            'Email is already in use';
                                      } else if (e.code == 'invalid-email') {
                                        errorMessage = 'invalid email';
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(errorMessage),
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          duration: Duration(seconds: 3),
                                          action: SnackBarAction(
                                            label: 'Close',
                                            textColor: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                _email.text = '';
                                                _password.text = '';
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text('Next'),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      );
                    default:
                      return const Text('Loading.....');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
