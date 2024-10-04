import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.all(18.0), // Optional padding around the TextField
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search Events Creators Events ...', // Placeholder text
            filled: true, // This ensures the background color is applied
            fillColor: Colors.white, // Background color of the TextField
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
              borderSide: BorderSide(
                color: Colors.black54, // Border color
                width: 2.0, // Border width
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12), // Rounded corners on focus
              borderSide: BorderSide(
                color: Colors.black54, // Border color when focused
                width: 2.0,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black54,
              size: 28,
            ), // Search icon
          ),
        ),
      ),
    );
  }
}
