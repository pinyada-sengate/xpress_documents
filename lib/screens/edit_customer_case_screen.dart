import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xpress_documents/mixins/date_time_mixin.dart';
import 'package:xpress_documents/widgets/customer_profile_bar.dart';

import '../models/customer.dart';
import '../models/customer_case.dart';
import 'customer_case_paid_screen.dart';

class EditCustomerCaseScreen extends StatefulWidget {
  late CustomerCase customerCase;
  final Customer customer;

  EditCustomerCaseScreen(
      {Key? key, required this.customerCase, required this.customer})
      : super(key: key);

  @override
  _EditCustomerCaseScreenState createState() => _EditCustomerCaseScreenState();
}

class _EditCustomerCaseScreenState extends State<EditCustomerCaseScreen>
    with DateTimeMixin {
  final CollectionReference _caseCollection =
      FirebaseFirestore.instance.collection('cases');

  getCustomerCase(String? id) async {
    var document = await _caseCollection.doc(id).get();
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    CustomerCase customerCase = CustomerCase.fromJson(data);
    customerCase.id = document.id;

    setState(() {
      widget.customerCase = customerCase;
    });
  }

  Widget caseTypeField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Case Type : ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Text(
              widget.customerCase.caseType,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget alienNumberField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Alien Number : ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Text(
              widget.customerCase.alienNumber,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget caseStatusField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Case Status : ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Text(
              widget.customerCase.caseStatus,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget startDateField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Start Date : ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Text(
              getDate(widget.customerCase.startDate),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget totalPriceField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Total Price : ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Text(
              widget.customerCase.price.toString(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget paidField() {
    return GestureDetector(
//      onTap: () => Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (context) => CustomerCasePaidScreen(
//            customerCase: widget.customerCase,
//          ),
//        ),
//      ),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (context) => CustomerCasePaidScreen(
            customerCase: widget.customerCase,
          ),
        );
        Navigator.of(context).push(materialPageRoute).then((value) async {
          await getCustomerCase(widget.customerCase.id);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          children: [
            const Text(
              'Paid : ',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                widget.customerCase.paid.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.navigate_next,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Type ${widget.customerCase.caseType}'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          CustomerProfileBar(customer: widget.customer),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              caseTypeField(),
              alienNumberField(),
              caseStatusField(),
              startDateField(),
              totalPriceField(),
              paidField(),
            ],
          ),
        ],
      ),
    );
  }
}
