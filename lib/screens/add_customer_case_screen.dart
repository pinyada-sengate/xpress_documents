import 'package:flutter/material.dart';

import '../models/customer.dart';

class AddCustomerCaseScreen extends StatefulWidget {

  final Customer customer;

  const AddCustomerCaseScreen({ Key? key, required this.customer }) : super(key: key);

  @override
  State<AddCustomerCaseScreen> createState() => _AddCustomerCaseScreenState();
}

class _AddCustomerCaseScreenState extends State<AddCustomerCaseScreen> {
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
              'Case Information',
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
                hintText: 'Type of case',
                prefixIcon: Icon(
                  Icons.gavel,
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
                hintText: 'Total Price',
                prefixIcon: Icon(
                  Icons.attach_money,
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
                hintText: 'Down Payment',
                prefixIcon: Icon(
                  Icons.account_balance_wallet,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  //TODO: save to database
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
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
        ],
      ),
    );
  }
}