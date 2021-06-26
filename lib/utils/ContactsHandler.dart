import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:contatissimos/utils/strings.dart' as strings;

class ContactsHandler {
  // Essa classe cuida de ações tomadas referentes ao(s) contato(s)

  static Future<void> addNewContact(
      String nome, String apelido, String telefone) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _firestore
        .collection(strings.collectionName)
        .add({'nome': nome, 'apelido': apelido, 'telefone': telefone});
  }
}
