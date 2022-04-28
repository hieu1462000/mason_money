import 'package:flutter/material.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,
            hoverColor: Colors.black,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 10),
            hintText: "Find products...",
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 16,
            ),
            hintStyle: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey[800]),
          )),
    );
  }
}
