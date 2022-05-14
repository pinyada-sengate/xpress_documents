import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/customer.dart';
import '../models/customer_case.dart';
import '../screens/customer_screen.dart';

class RecentCustomers extends StatefulWidget {
  const RecentCustomers({Key? key}) : super(key: key);

  @override
  State<RecentCustomers> createState() => _RecentCustomersState();
}

class _RecentCustomersState extends State<RecentCustomers> {
  List<Customer> _recentCustomers = [];
  late Future recentCustomersLoaded;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recentCustomersLoaded = getRecentCustomers();
  }

  getRecentCustomers() async {
    var data = await FirebaseFirestore.instance
        .collection('customers')
        .orderBy('createdAt', descending: true)
        .limit(3)
        .get();

    var documents = data.docs;
    List<Customer> customers = [];
    for (int i = 0; i < documents.length; i++) {
      var document = documents[i];
      Map<String, dynamic> data = document.data();
      Customer customer = Customer.fromJson(data);
      var id = document.id;
      customer.id = id;

      List<CustomerCase> customerCases = await getCustomerCasesByCustomerId(id);
      customer.customerCases = customerCases;
      customers.add(customer);
    }

    setState(() {
      _recentCustomers = customers;
    });
  }

  Future<List<CustomerCase>> getCustomerCasesByCustomerId(String id) async {
    var data = await FirebaseFirestore.instance
        .collection('cases')
        .where('customerId', isEqualTo: id)
        .get();

    var documents = data.docs;
    List<CustomerCase> customerCases = [];
    for (var i = 0; i < documents.length; i++) {
      var document = documents[i];
      Map<String, dynamic> data = document.data();
      CustomerCase customerCase = CustomerCase.fromJson(data);
      customerCase.id = document.id;
      customerCases.add(customerCase);
    }

    return customerCases;
  }

  _buildRecentCustomer(BuildContext context, Customer customer) {
    int totalPrice = 0;
    int totalPaid = 0;
    var customerCases = customer.customerCases;

    for (var i = 0; i < customerCases.length; i++) {
      CustomerCase customerCase = customerCases[i];
      totalPrice += customerCase.price;
      totalPaid += customerCase.paid;
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CustomerScreen(
            customer: customer,
          ),
        ),
      ),
      child: Container(
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
                      'Paid: \$${totalPaid.toString()}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Next Payment: \$' + (totalPrice - totalPaid).toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Customers',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: _recentCustomers.length,
            itemBuilder: (BuildContext context, int index) {
              Customer customer = _recentCustomers[index];
              return _buildRecentCustomer(context, customer);
            },
          ),
        ),
      ],
    );
  }
}
