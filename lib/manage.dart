import 'package:flutter/material.dart';

//import 'package:flutter_application_1/button.dart';
import 'db.dart';

class MyManage extends StatefulWidget {
  const MyManage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyManageState createState() => _MyManageState();
}

class _MyManageState extends State<MyManage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _phoneNumber = '';
  String _vehicleType = '';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card List',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Manage Raids'),
          backgroundColor: const Color.fromARGB(255, 73, 79, 239),
        ),
        body: ListView(
          children: globalList.map((item) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(item.journey),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Driver: ${item.name}'),
                    Text('Vehicle Type: ${item.wheeler}'),
                    Text('Mobile Number: ${item.mobileno}'),
                  ],
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 73, 79, 239)),
                  child: const Text('Accept Ride'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'accept');
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
