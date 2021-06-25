import 'package:contatissimos/components/wrap_container.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contatissimos/components/contact_tile.dart';
import 'package:contatissimos/utils/constants.dart' as constants;
import 'package:contatissimos/utils/strings.dart' as strings;
import 'package:contatissimos/utils/fakeJSON.dart' as contacts_JSON;

import 'new_contact_screen.dart';

class ContactsScreen extends StatefulWidget {
  static final String screenId = 'contacts_screen';

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Widget> _itemList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      showContacts(contacts_JSON
          .MyContacts); // TODO: trocar para JSON que retorna do Firebase
    });
  }

  void showContacts(dynamic json) {
    for (int i = 0; i < json.length; i++) {
      // TODO: implementar for in
      var apelido;

      apelido = json[i]["apelido"];

      _itemList.add(ContactTile(
        leading: Icon(Icons.account_circle),
        trailing: Icon(Icons.phone),
        title: apelido,
      ));

      _itemList.add(SizedBox(height: 10));

      setState(() {});
    }
  }

  void clearList(list) {
    list = [];
  }

  var _myContacts = contacts_JSON.MyContacts;
  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: constants.primary,
          title: Text(strings.appDisplayName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(constants.wrapContainerPadding),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: _itemList,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: constants.primary,
                        textStyle:
                            TextStyle(fontSize: constants.buttonFontSize),
                      ),
                      onPressed: () {
                        print(
                            'shalshjdk'); // TODO: implementar função que atualiza lista de contatos
                      },
                      child: Text(strings.updateContactList),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: constants.primary,
                        textStyle:
                            TextStyle(fontSize: constants.buttonFontSize),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, NewContactScreen.screenId);
                      },
                      child: Text(strings.addNewContact),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
String x = "Stephen Ricard";
String[] nameparts = x.split(" ");
String initials = nameparts[0].charAt(0).toUpperCase()+nameparts[1].charAt(0).toUpperCase();
 */
