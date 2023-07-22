//import 'package:flutter/cupertino.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'button.dart';
import 'firebase_options.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
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

  @override
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
              padding: const EdgeInsets.only(left: 35, top: 75),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                ),
              ),
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
                                    'Email                                             @mlrit.ac.in',
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
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
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
                                          .signInWithEmailAndPassword(
                                              email: email, password: password);
                                      Navigator.pushReplacementNamed(
                                          context, 'form');

                                      print(userCredential);
                                    } on FirebaseAuthException catch (e) {
                                      String errorMessage;
                                      if (e.code == 'user-not-found') {
                                        errorMessage = 'user not found';
                                      } else if (e.code == 'wrong-password') {
                                        errorMessage = 'wrong password';
                                      } else {
                                        errorMessage = 'An error occured';
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
                                  child: const Text(
                                    'signin',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'password');
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 73, 79, 239),
                                      ),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'forgot');
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 73, 79, 239),
                                      ),
                                    )),
                              ],
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
