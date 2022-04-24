import 'package:flutter/material.dart';

import '../models/customer_case.dart';

class EditCustomerCaseScreen extends StatefulWidget {
  final CustomerCase customerCase;

  const EditCustomerCaseScreen({Key? key, required this.customerCase})
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
        children: <Widget>[],
      ),
    );
  }
}
