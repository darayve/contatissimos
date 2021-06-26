import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:contatissimos/utils/constants.dart' as constants;
import 'package:contatissimos/utils/strings.dart' as strings;

import 'package:contatissimos/components/wrap_container.dart';
import '../utils/ContactsHandler.dart';

class NewContactScreen extends StatelessWidget {
  static final String screenId = 'edit_contact_screen';

  String nome, apelido, telefone;

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: constants.primary,
          title: Text(strings.appNewContactTitle),
        ),
        body: Container(
          padding: EdgeInsets.all(constants.wrapContainerPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://www.petz.com.br/blog/wp-content/uploads/2021/03/piercing-para-cachorro-2.jpg'),
              ),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: strings.nome,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      nome = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: strings.apelido,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      apelido = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: strings.telefone,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    inputFormatters: [maskFormatter],
                    onChanged: (value) {
                      telefone = value;
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: constants.primary,
                        textStyle: TextStyle(
                          fontSize: constants.buttonFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(strings.cancelNewContact),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: constants.primary,
                        textStyle: TextStyle(
                            fontSize: constants.buttonFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        ContactsHandler.addNewContact(nome, apelido, telefone);
                        Navigator.pop(context);
                      },
                      child: Text(strings.saveContact),
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
