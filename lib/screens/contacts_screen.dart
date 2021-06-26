import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contatissimos/components/contact_tile.dart';
import 'package:contatissimos/components/wrap_container.dart';
import 'package:contatissimos/screens/contact_info_screen.dart';
import 'package:contatissimos/screens/new_contact_screen.dart';

import 'package:contatissimos/utils/constants.dart' as constants;
import 'package:contatissimos/utils/strings.dart' as strings;

class ContactsScreen extends StatefulWidget {
  static final String screenId = 'contacts_screen';

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, NewContactScreen.screenId);
          },
          label: Text(strings.addNewContact),
          icon: Icon(Icons.add),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: constants.primary,
          title: Text(strings.appDisplayName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(constants.wrapContainerPadding),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('contatos').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: constants.primaryLight,
                    );
                  } else {
                    final contatos = snapshot.data.docs;
                    List<ContactTile> contatosWidgets = [];

                    for (var contato in contatos) {
                      final nome = contato.get('nome');
                      final apelido = contato.get('apelido');
                      final telefone = contato.get('telefone');

                      final contatoWidget = ContactTile(
                        contactPhoto: CircleAvatar(
                          backgroundColor: constants.primaryLight,
                          backgroundImage: NetworkImage(
                              'https://gameforge.com/de-DE/littlegames/includes/images/games/8581_5eb3edf2afb29.jpg'),
                        ),
                        apelido: apelido,
                        telefone: telefone,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ContactInfo(
                              name: nome,
                              nickname: apelido,
                              phone: telefone,
                            );
                          }));
                        },
                      );
                      contatosWidgets.add(contatoWidget);
                    }
                    return Expanded(
                      child: ListView(
                        children: contatosWidgets,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
