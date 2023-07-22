import 'dart:ui';
import 'package:flutter/material.dart';

import 'bottomnavigationbar.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushReplacementNamed(context, 'MyScreen');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, 'form');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'stulift',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 73, 79, 239),
        elevation: 0.40,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1.png'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(175, 300, 90, 60),
          ),
          Positioned.fill(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
