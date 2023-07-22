import 'package:flutter/material.dart';

import 'button.dart';

class MyAccepts extends StatefulWidget {
  const MyAccepts({super.key});

  @override
  State<MyAccepts> createState() => _MyAcceptsState();
}

class _MyAcceptsState extends State<MyAccepts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/2.png'), fit: BoxFit.contain)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.60,
                  right: 35,
                  left: 130),
              child: const Text(
                'Request Accepted',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.90,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: getButtonStyle(327, 50),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'homepage');
                          },
                          child: const Text(
                            'Back Home',
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
