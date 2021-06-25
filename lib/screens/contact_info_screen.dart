import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  static final String screenId = 'contact_info_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Kim Lip"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text("Go to Choerry"),
          onPressed: () {},
        ),
      ),
    );
  }
}
