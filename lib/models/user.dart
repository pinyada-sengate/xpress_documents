import 'customer.dart';

class User {
  final String name;
  final List<Customer> customers;

  User({
    required this.name,
    required this.customers,
  });
}
