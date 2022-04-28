import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xpress_documents/mixins/date_time_mixin.dart';
import 'package:xpress_documents/mixins/validation_mixin.dart';

import '../models/customer_case.dart';

class CustomerCasePaidScreen extends StatefulWidget {
  final CustomerCase customerCase;
  CustomerCasePaidScreen({Key? key, required this.customerCase})
      : super(key: key);

  @override
  State<CustomerCasePaidScreen> createState() => _CustomerCasePaidScreenState();
}

class _CustomerCasePaidScreenState extends State<CustomerCasePaidScreen>
    with ValidationMixin, DateTimeMixin {
  final formKey = GlobalKey<FormState>();
  final CollectionReference _caseCollection =
      FirebaseFirestore.instance.collection('cases');

  int paymentAdded = 0;

  Widget paymentField() {
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
          hintText: 'Add Payment',
          prefixIcon: Icon(
            Icons.account_balance_wallet,
            size: 30.0,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter payment';
          }

          if (!isNumeric(value)) {
            return 'Please enter a valid payment';
          }

          if (double.tryParse(value)! <= 0) {
            return 'Payment must be more than 0';
          }

          int paymentLeft =
              widget.customerCase.price - widget.customerCase.paid;
          if (double.tryParse(value)! > paymentLeft) {
            return 'Payment added can not be more than total price';
          }

          return null;
        },
        onSaved: (value) {
          paymentAdded = int.parse(value!);
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

//                CustomerCase customerCase = CustomerCase(
//                  customerId: widget.customer.id ?? '',
//                  caseType: caseType,
//                  alienNumber: alienNumber,
//                  caseStatus: 'New',
//                  startDate: now,
//                  price: price,
//                  paid: paid,
//                );

                //await _caseCollection.up(customerCase.toJson());
                int paid = paymentAdded + widget.customerCase.paid;
                await _caseCollection
                    .doc(widget.customerCase.id)
                    .update({'paid': paid});

                formKey.currentState?.reset();

                Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add payment'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Next Payment: \$${widget.customerCase.price - widget.customerCase.paid}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                paymentField(),
                submitButton(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              'Last Payment: \$${widget.customerCase.price}',
              style: const TextStyle(
                fontSize: 16.0,
                //fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              'Last Payment Date: ${getDate(widget.customerCase.startDate)}',
              style: const TextStyle(
                fontSize: 16.0,
                //fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
