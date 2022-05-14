import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/customer.dart';
import '../screens/customer_screen.dart';

class RecentCustomers extends StatefulWidget {
  const RecentCustomers({Key? key}) : super(key: key);

  @override
  State<RecentCustomers> createState() => _RecentCustomersState();
}

class _RecentCustomersState extends State<RecentCustomers> {
  List _recentCustomers = [];
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

    setState(() {
      _recentCustomers = data.docs;
    });
  }

  _buildRecentCustomer(BuildContext context, Customer customer) {
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
                      'Paid: \$${customer.paid.toString()}',
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
                      'Next Payment: \$' +
                          (customer.price - customer.paid).toString(),
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
              var document = _recentCustomers[index];
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              Customer customer = Customer.fromJson(data);
              customer.id = document.id;
              return _buildRecentCustomer(context, customer);
            },
          ),
        ),
      ],
    );
  }
}
