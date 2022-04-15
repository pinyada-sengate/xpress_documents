import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../widgets/search_customer.dart';
import 'customer_screen.dart';

class CustomerListScreen extends StatefulWidget {
  final String searchKey;
  const CustomerListScreen({Key? key, this.searchKey = ""}) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final TextEditingController _searchController = TextEditingController();

  late Future customersLoaded;
  List _allCustomers = [];
  List _customerSearchList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customersLoaded = getCustomers();
    print('customer list : ${widget.searchKey}');
    _searchController.text = widget.searchKey;
  }

  _onSearchChanged() {
    searchCustomersList();
    print(_searchController.text);
  }

  _onEditingComplete() {}

  searchCustomersList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var document in _allCustomers) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        Customer customer = Customer.fromJson(data);
        String name =
            '${customer.name.toLowerCase()} ${customer.surname.toLowerCase()}';
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(document);
        }
      }
    } else {
      showResults = _allCustomers;
    }
    setState(() {
      _customerSearchList = showResults;
    });
  }

  getCustomers() async {
    var data = await FirebaseFirestore.instance.collection('customers').get();

    setState(() {
      _allCustomers = data.docs;
    });

    searchCustomersList();
  }

  Widget _buildCustomer(BuildContext context, Customer customer) {
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
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                width: 100,
                height: 100,
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
                      'Phone Number: ${customer.phoneNumber}',
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
                      'Email: ${customer.email}',
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

  _buildCustomerList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('customers').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        if (!snapshot.hasData) {
          return const Text('No data');
        } else {
          return Expanded(
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                Customer customer = Customer.fromJson(data);
                return _buildCustomer(context, customer);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Customers'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchCustomer(
            searchController: _searchController,
            onEditingComplete: _onEditingComplete,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Customers',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          //_buildCustomerList(),
          Expanded(
            child: ListView.builder(
              itemCount: _customerSearchList.length,
              itemBuilder: (BuildContext context, int index) {
                var document = _customerSearchList[index];
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                Customer customer = Customer.fromJson(data);
                return _buildCustomer(context, customer);
              },
            ),
          ),
        ],
      ),
    );
  }
}
