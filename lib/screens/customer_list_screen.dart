import 'package:flutter/material.dart';

import '../widgets/search_customer.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Customers'),
        centerTitle: true,
      ),
      body: ListView(
        children: const <Widget>[
          SearchCustomer(),
        ],
      ),
    );
  }
}
