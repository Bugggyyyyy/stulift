import 'package:flutter/material.dart';
import 'db.dart';
import 'bottomnavigationbar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyManageState createState() => _MyManageState();
}

class _MyManageState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  int _selectedIndex = 1;

  String _name = '';
  String _phoneNumber = '';
  String _vehicleType = '';
  String _people = '';
  String _no = '';
  List<String> _places = ['', '', '', '', ''];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Entered Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $_name'),
              Text('Phone number: $_phoneNumber'),
              Text('Vehicle type: $_vehicleType'),
              Text('passenger : $_people'),
              Text('no:$_no'),
              const Text('Details for five places:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < _places.length; i++)
                    Text('Place ${i + 1}: ${_places[i]}'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _formKey.currentState!.reset();
                setState(() {
                  _name = '';
                  _phoneNumber = '';
                  _vehicleType = '';
                  _people = '';
                  _no = '';
                  _places = ['', '', '', '', ''];
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushReplacementNamed(context, 'MyScreen');
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: globalList.map((item) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: _getVehicleIcon(item.wheeler),
                title: Text(item.journey),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Driver: ${item.name}'),
                    Text('Vehicle Type: ${item.wheeler}'),
                    Text('Mobile Number: ${item.mobileno}'),
                    Text('No.of passengers: ${item.people}'),
                    Text('Vehicle No. :${item.no}'),
                  ],
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 73, 79, 239),
                  ),
                  child: const Text('Request Ride'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'request');
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Icon _getVehicleIcon(String wheeler) {
    switch (wheeler) {
      case 'Car':
        return const Icon(Icons.directions_car);
      case 'car':
        return const Icon(Icons.directions_car);
      case 'bike':
        return const Icon(Icons.motorcycle);
      case 'Bike':
        return const Icon(Icons.motorcycle);
      case 'scooty':
        return const Icon(Icons.bike_scooter);
      default:
        return const Icon(Icons.motorcycle);
    }
  }
}
