import 'package:xpress_documents/models/customer_case.dart';

import 'customer.dart';

class User {
  final String name;
  final List<Customer> customers;
  final List<CustomerCase> customerCases;

  User({
    required this.name,
    required this.customers,
    required this.customerCases,
  });
}
