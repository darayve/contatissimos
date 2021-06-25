import 'package:contatissimos/screens/contacts_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart' as constants;
import '../utils/strings.dart' as strings;

import 'package:contatissimos/components/wrap_container.dart';

class NewContactScreen extends StatelessWidget {
  static final String screenId = 'edit_contact_screen';

  String nome, apelido, telefone;

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
                      labelText: 'Nome',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Apelido',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
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
                        Navigator.pushNamed(context, ContactsScreen.screenId);
                      },
                      child: Text(strings.cancelNewContact.toUpperCase()),
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
                        print('jjj'); // TODO: implementar função de salvar
                      },
                      child: Text(strings.saveNewContact.toUpperCase()),
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
Foto de perfil
Apelido ao lado direito da foto
3 campos: nome, apelido, telefone

botão salvar, cancelar e remover contato
 */
