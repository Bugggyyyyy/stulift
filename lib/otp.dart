import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/button.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 79, 239),
      
        title: const Text('Verify Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'OTP Sent',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 68,
                    height: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 73, 79, 239),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 68,
                    height: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 73, 79, 239),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 68,
                    height: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 73, 79, 239),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 68,
                    height: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 73, 79, 239),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Didn't recieve otp.",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'resend OTP',
                        style: TextStyle(
                          fontSize: 20,
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
      bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'homepage');
            },
            style: getButtonStyle(327, 50),
            child: const Text(
              'verify & create',
              style: TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}
