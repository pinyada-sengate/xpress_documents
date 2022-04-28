import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpress_documents/models/customer.dart';

import 'add_customer_case_screen.dart';
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
  String phoneNumber = '';
  String email = '';
  String address = '';
  String city = '';
  String state = '';
  String zipCode = '';

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
            margin: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  addressField(),
                  cityField(),
                  stateField(),
                  zipCodeField(),
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
        validator: validateSurname,
        onSaved: (value) {
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
          phoneNumber = value!;
        },
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
          email = value!;
        },
      ),
    );
  }

  Widget addressField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.streetAddress,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
            ),
          ),
          hintText: 'Address',
          prefixIcon: Icon(
            Icons.home,
            size: 30.0,
          ),
        ),
        validator: validateAddress,
        onSaved: (value) {
          address = value!;
        },
      ),
    );
  }

  Widget cityField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.streetAddress,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
            ),
          ),
          hintText: 'City',
          prefixIcon: Icon(
            Icons.location_city_outlined,
            size: 30.0,
          ),
        ),
        validator: validateCity,
        onSaved: (value) {
          city = value!;
        },
      ),
    );
  }

  Widget stateField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.streetAddress,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
            ),
          ),
          hintText: 'State',
          prefixIcon: Icon(
            Icons.location_city_outlined,
            size: 30.0,
          ),
        ),
        validator: validateState,
        onSaved: (value) {
          state = value!;
        },
      ),
    );
  }

  Widget zipCodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
            ),
          ),
          hintText: 'Zip code',
          prefixIcon: Icon(
            Icons.local_shipping_outlined,
            size: 30.0,
          ),
        ),
        validator: validateZipCode,
        onSaved: (value) {
          zipCode = value!;
        },
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SizedBox(
          height: 40,
          width: 120,
          child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                DateTime now = DateTime.now();

                Customer customer = Customer(
                  name: name,
                  surname: surname,
                  phoneNumber: phoneNumber,
                  email: email,
                  address: address,
                  city: city,
                  state: state,
                  zipCode: zipCode,
                  createdAt: now,
                );

                var docRef = await _customerCollection.add(customer.toJson());
                customer.id = docRef.id;
                formKey.currentState?.reset();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddCustomerCaseScreen(
                            customer: customer,
                            previousPage: 'AddCustomerScreen',
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
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
