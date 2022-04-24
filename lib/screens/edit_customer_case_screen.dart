import 'package:flutter/material.dart';
import 'package:xpress_documents/widgets/customer_profile_bar.dart';

import '../models/customer.dart';
import '../models/customer_case.dart';

class EditCustomerCaseScreen extends StatefulWidget {
  final CustomerCase customerCase;
  final Customer customer;

  const EditCustomerCaseScreen(
      {Key? key, required this.customerCase, required this.customer})
      : super(key: key);

  @override
  _EditCustomerCaseScreenState createState() => _EditCustomerCaseScreenState();
}

class _EditCustomerCaseScreenState extends State<EditCustomerCaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Type ${widget.customerCase.caseType}'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          CustomerProfileBar(
            customer: widget.customer,
          )
        ],
      ),
    );
  }
}
