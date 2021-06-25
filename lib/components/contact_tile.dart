import 'package:flutter/material.dart';

import 'package:contatissimos/utils/ContactsHandler.dart';

class ContactTile extends StatelessWidget {
  // Método construtor
  // Variáveis: leading, trailing, title

  ContactTile({this.leading, this.trailing, this.title});

  final Icon leading;
  final Icon trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: alterar estrutura de contato
    return ListTile(
      leading: leading,
      trailing: trailing,
      title: Text(title),
      onTap: ContactsHandler.seeContactInfo,
    );
  }
}
