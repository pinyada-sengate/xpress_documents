import 'package:flutter/material.dart';

import '../models/customer.dart';

class CustomerScreen extends StatefulWidget {
  final Customer customer;

  const CustomerScreen({ Key? key, required this.customer }) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.customer.name} ${widget.customer.surname}'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text('${widget.customer.name} ${widget.customer.surname} Profile'),
        ],
      ),
    );
  }
}