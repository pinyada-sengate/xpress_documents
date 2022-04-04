import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import 'add_customer_address_screen.dart';
import '../mixins/validation_mixin.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen>
    with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final CollectionReference _customerCollection =
      FirebaseFirestore.instance.collection('customers');

  String name = '';
  String surname = '';
  String telephoneNumber = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Customer'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'Personal',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  nameField(),
                  surnameField(),
                  telephoneNumberField(),
                  emailField(),
                  submitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
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
        validator: validateName,
        onSaved: (value) {
          print('name: $value');
          name = value!;
        },
      ),
    );
  }

  Widget surnameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
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
        validator: validateName,
        onSaved: (value) {
          print('surname: $value');
          surname = value!;
        },
      ),
    );
  }

  Widget telephoneNumberField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
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
        validator: validateTelephoneNumber,
        onSaved: (value) {
          print('telephone number: $value');
          telephoneNumber = value!;
        },
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        decoration: const InputDecoration(
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
        validator: validateEmail,
        onSaved: (value) {
          print('email: $value');
          email = value!;
        },
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 40,
        width: 120,
        child: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              await _customerCollection.add({
                'name': name,
                'surname': surname,
                'email': email,
                'phone_number': telephoneNumber,
//                'address': customer.address,
//                'city': customer.city,
//                'state': customer.state,
//                'zipcode': customer.zipcode,
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCustomerAddressScreen(
                          customer: currentUser.customers[0],
                        )),
              );
            }
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
    );
  }
}
