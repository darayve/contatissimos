import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:contatissimos/utils/constants.dart' as constants;

class ContactTile extends StatelessWidget {
  ContactTile({this.contactPhoto, this.apelido, this.onTap, this.telefone});

  final CircleAvatar contactPhoto;
  final String apelido;
  final Function onTap;
  final String telefone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  blurRadius: 3,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onTap,
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      children: [
                        contactPhoto,
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          apelido,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {UrlLauncher.launch('tel:$telefone')},
                  child: Icon(
                    Icons.phone,
                    color: constants.secondary,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 13,
        )
      ],
    );
  }
}
