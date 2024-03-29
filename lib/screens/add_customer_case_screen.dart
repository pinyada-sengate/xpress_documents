import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../mixins/validation_mixin.dart';
import '../models/customer_case.dart';
import '../models/customer.dart';
import '../widgets/customer_profile_bar.dart';

class AddCustomerCaseScreen extends StatefulWidget {
  final Customer customer;
  final String previousPage;

  const AddCustomerCaseScreen(
      {Key? key, required this.customer, required this.previousPage})
      : super(key: key);

  @override
  State<AddCustomerCaseScreen> createState() => _AddCustomerCaseScreenState();
}

class _AddCustomerCaseScreenState extends State<AddCustomerCaseScreen>
    with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final CollectionReference _caseCollection =
      FirebaseFirestore.instance.collection('cases');

  final _textDownPayment = TextEditingController();

  String caseType = '';
  String alienNumber = '';
  int price = 0;
  int paid = 0;

  @override
  void dispose() {
    _textDownPayment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Case'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          CustomerProfileBar(customer: widget.customer),
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
                      'Case Information',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  caseTypeField(),
                  alienNumberField(),
                  totalPriceField(),
                  downPaymentField(),
                  submitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customerProfile(Customer customer) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 100.0,
              width: 100.0,
              image: AssetImage(customer.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${customer.name} ${customer.surname}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'ID: ${customer.id}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget caseTypeField() {
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
          hintText: 'Type of case',
          prefixIcon: Icon(
            Icons.gavel,
            size: 30.0,
          ),
        ),
        validator: validateCaseType,
        onSaved: (value) {
          caseType = value!;
        },
      ),
    );
  }

  Widget alienNumberField() {
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
          hintText: 'Alien Number',
          prefixIcon: Icon(
            Icons.perm_identity,
            size: 30.0,
          ),
        ),
        validator: validateAlienNumber,
        onSaved: (value) {
          alienNumber = value!;
        },
      ),
    );
  }

  Widget totalPriceField() {
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
          hintText: 'Total Price',
          prefixIcon: Icon(
            Icons.attach_money,
            size: 30.0,
          ),
        ),
        validator: validateTotalPrice,
        onSaved: (value) {
          price = int.parse(value!);
        },
      ),
    );
  }

  Widget downPaymentField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        controller: _textDownPayment,
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
          hintText: 'Down Payment',
          prefixIcon: Icon(
            Icons.account_balance_wallet,
            size: 30.0,
          ),
        ),
        validator: validateDownPayment,
        onSaved: (value) {
          paid = int.parse(value!);
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
                if (paid > price) {
                  _textDownPayment.text = price.toString();
                  paid = price;
                  return;
                }

                DateTime now = DateTime.now();

                CustomerCase customerCase = CustomerCase(
                  customerId: widget.customer.id ?? '',
                  caseType: caseType,
                  alienNumber: alienNumber,
                  caseStatus: 'New',
                  startDate: now,
                  price: price,
                  paid: paid,
                  lastPayment: paid,
                  lastPaymentDate: now,
                );

                await _caseCollection.add(customerCase.toJson());
                formKey.currentState?.reset();

                if (widget.previousPage == 'CustomerScreen') {
                  Navigator.of(context).pop();
                } else {
                  Navigator.popUntil(
                      context, (Route<dynamic> predicate) => predicate.isFirst);
                }
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
