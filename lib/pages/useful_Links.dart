import 'package:a2is/pages/mentions.dart';
import 'package:a2is/utils/colors.dart';
import 'package:flutter/material.dart';

class UsefulLinksPage extends StatefulWidget {
  const UsefulLinksPage({Key? key}) : super(key: key);

  @override
  State<UsefulLinksPage> createState() => _UsefulLinksPageState();
}

class _UsefulLinksPageState extends State<UsefulLinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Liens utiles", textAlign: TextAlign.center,),
      ),
      body: ListView(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ListTile(
                  title: const Text("Mentions Légales", textAlign: TextAlign.center,),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LegalMentionsPage()));},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
