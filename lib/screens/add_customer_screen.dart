import 'package:flutter/material.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({ Key? key }) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Customer'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Personal',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Name',
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Surname',
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Telephone Number',
                prefixIcon: Icon(
                  Icons.phone,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Address',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Address',
                prefixIcon: Icon(
                  Icons.home,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'City',
                prefixIcon: Icon(
                  Icons.location_city_outlined,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'State',
                prefixIcon: Icon(
                  Icons.location_city_outlined,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                hintText: 'Zipcode',
                prefixIcon: Icon(
                  Icons.local_shipping_outlined,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}