import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/recent_customers.dart';
import 'add_customer_screen.dart';
import 'customer_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // prepare firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
              centerTitle: true,
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Xpress Documents'),
              centerTitle: true,
            ),
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          width: 0.8,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      hintText: 'Search Name and Surname',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          //TODO: reset search text
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
                //   child: Text(
                //     'Hey Jenny Dorado',
                //     style: TextStyle(
                //       fontSize: 24.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                //   child: Text(
                //     'What do you want today?',
                //     style: TextStyle(
                //       fontSize: 18.0,
                //     ),
                //   ),
                // ),
                const RecentCustomers(),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddCustomerScreen(),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 75.0,
                          ),
                        ),
                        const Text(
                          'Add New Customer',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CustomerListScreen(),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.view_list_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 75.0,
                          ),
                        ),
                        const Text(
                          'List of Customers',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
