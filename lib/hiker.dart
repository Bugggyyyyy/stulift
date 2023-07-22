import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'db.dart';
import 'bottomnavigationbar.dart';

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  _MyScreen createState() => _MyScreen();
}

class _MyScreen extends State<MyScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController wheelController = TextEditingController();
  TextEditingController routingController = TextEditingController();
  TextEditingController passengerController = TextEditingController();
  TextEditingController noController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 1:
        Navigator.pushReplacementNamed(context, 'form');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(151515),
      appBar: AppBar(
        title: const Text('Give Ride'),
        backgroundColor: const Color.fromARGB(255, 73, 79, 239),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 79, 239),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: passwordController,
                //obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                  hintText: 'Enter mobile number',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 79, 239),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: wheelController,
                //obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Vehicle Type',
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 79, 239),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: routingController,
                //obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Route',
                  hintText: 'enter route of the session',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 79, 239),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: noController,
                //obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'No.of passengers',
                  hintText: 'No.of passengers that can be seated',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 79, 239),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: passengerController,
                //obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Vechile no.',
                  hintText: 'vechile no.',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 79, 239),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: getButtonStyle(327, 50),
              child: const Text('POST'),
              onPressed: () {
                MyClass object1 = MyClass(
                  name: nameController.text,
                  mobileno: passwordController.text,
                  wheeler: wheelController.text,
                  journey: routingController.text,
                  people: noController.text,
                  no: passengerController.text,
                );

                globalList.add(object1);
                print('updated object');
                print(globalList.length);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
