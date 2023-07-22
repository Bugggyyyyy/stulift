import 'package:flutter/material.dart';

class MyForgot extends StatefulWidget {
  const MyForgot({super.key});

  @override
  State<MyForgot> createState() => _MyForgotState();
}

class _MyForgotState extends State<MyForgot> {
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
              padding: const EdgeInsets.only(left: 35, top: 85),
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  
                  
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
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
                      height: 10,
                    ),
                   
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'otp');
                            },
                            child: const Text(
                              'Send OTP',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 73, 79, 239),
                              ),
                            )),
                      ],
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
