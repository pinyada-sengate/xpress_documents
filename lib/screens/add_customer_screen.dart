import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/customer.dart';
import 'add_customer_address_screen.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  CollectionReference _customerCollection =
      FirebaseFirestore.instance.collection('customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Customer'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Personal',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Name',
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 30.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Surname',
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 30.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Telephone Number',
                prefixIcon: Icon(
                  Icons.phone,
                  size: 30.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  // TODO: form validation
                  Customer customer = currentUser.customers[0];
                  await _customerCollection.add({
                    'name': customer.name,
                    'surname': customer.surname,
                    'email': customer.email,
                    'phone_number': customer.phoneNumber,
                    'address': customer.address,
                    'city': customer.city,
                    'state': customer.state,
                    'zipcode': customer.zipcode,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCustomerAddressScreen(
                              customer: currentUser.customers[0],
                            )),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
