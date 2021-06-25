import 'package:flutter/material.dart';

import 'screens/contacts_screen.dart';
import 'screens/contact_info_screen.dart';
import 'screens/new_contact_screen.dart';

import 'utils/constants.dart' as constants;
import 'utils/strings.dart' as strings;

void main() {
  runApp(ContatissimosApp());
}

class ContatissimosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactsScreen(),
      routes: {
        ContactsScreen.screenId: (context) => ContactsScreen(),
        ContactInfo.screenId: (context) => ContactInfo(),
        NewContactScreen.screenId: (context) => NewContactScreen(),
      },
      theme: ThemeData(
        primaryColor: constants.primary,
        accentColor: constants.primaryDark,
      ),
      title: strings.appDisplayName,
      debugShowCheckedModeBanner: false,
    );
  }
}
