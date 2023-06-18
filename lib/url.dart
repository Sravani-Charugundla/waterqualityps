import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
class url extends StatefulWidget {
  const url({Key? key}) : super(key: key);
  @override
  State<url> createState() => _urlState();
}
class _urlState extends State<url> {
  @override
  Widget build(BuildContext context) =>Scaffold(
    body: Center(
      child: Link(
        target:LinkTarget.blank,
        uri:Uri.parse('https://flutter.dev/'),
        builder:(context,followLink)=> ElevatedButton(
          child: Text("Click"),
          onPressed: (){},
        ),
      ),
    ),
  );
  }

