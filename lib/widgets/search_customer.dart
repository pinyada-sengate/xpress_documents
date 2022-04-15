import 'package:flutter/material.dart';

class SearchCustomer extends StatelessWidget {
  const SearchCustomer(
      {Key? key,
      required this.searchController,
      required this.onEditingComplete})
      : super(key: key);
  final TextEditingController searchController;
  final Function onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: searchController,
        onEditingComplete: () => onEditingComplete(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
          hintText: 'Search Name or Surname',
          prefixIcon: const Icon(
            Icons.search,
            size: 30.0,
          ),
//          suffixIcon: IconButton(
//            onPressed: () {
//              //TODO: reset search text
//            },
//            icon: const Icon(Icons.clear),
//          ),
        ),
      ),
    );
  }
}
