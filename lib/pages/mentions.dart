import 'package:a2is/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegalMentionsPage extends StatefulWidget {
  const LegalMentionsPage({Key? key}) : super(key: key);

  @override
  State<LegalMentionsPage> createState() => _LegalMentionsPageState();
}

class _LegalMentionsPageState extends State<LegalMentionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.mainRedColor,
        title: Text("Mentions Légales", textAlign: TextAlign.center,),
      ),);
  }
}
