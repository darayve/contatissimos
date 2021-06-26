import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:contatissimos/components/wrap_container.dart';

import 'package:contatissimos/utils/constants.dart' as constants;
import 'package:contatissimos/utils/strings.dart' as strings;

class ContactInfo extends StatefulWidget {
  ContactInfo({this.name, this.nickname, this.phone});

  static final String screenId = 'contact_info_screen';
  final String name, nickname, phone;

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final _firestore = FirebaseFirestore.instance;

  final nomeController = TextEditingController();
  final apelidoController = TextEditingController();
  final telefoneController = TextEditingController();

  String nomeEdit, apelidoEdit, telefoneEdit;
  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();

    nomeController.text = widget.name;
    apelidoController.text = widget.nickname;
    telefoneController.text = widget.phone;
  }

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
                    controller: nomeController,
                    onChanged: (value) {
                      nomeEdit = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: strings.apelido,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    controller: apelidoController,
                    onChanged: (value) {
                      apelidoEdit = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: strings.telefone,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    controller: telefoneController,
                    inputFormatters: [maskFormatter],
                    onChanged: (value) {
                      telefoneEdit = value;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: constants.warningYellow,
                            textStyle: TextStyle(
                                fontSize: constants.buttonFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(strings.cancelNewContact),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                            nomeController.text = nomeEdit;
                            apelidoController.text = apelidoEdit;
                            telefoneController.text = telefoneEdit;

                            _firestore
                                .collection(strings.collectionName)
                                .doc()
                                .set({
                              'nome': nomeController.text,
                              'apelido': apelidoController.text,
                              'telefone': telefoneController.text
                            });
                            Navigator.pop(context);
                          },
                          child: Text(strings.saveContact),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: constants.dangerRed,
                        textStyle: TextStyle(
                            fontSize: constants.buttonFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // REMOVE CONTATO
                        Navigator.pop(context);
                      },
                      child: Text(strings.removeContact),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
