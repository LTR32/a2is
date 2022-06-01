// @dart=2.9

import 'package:a2is/provider/loader_provider.dart';
import 'package:a2is/utils/ProgressHUD.dart';
import 'package:a2is/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>
      ( builder: (context, loaderModel, child) {
      return Scaffold(
        //appBar: _buildAppBar(),
        body: ProgressHUD(
          child: pageUI(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,
        ),
      );
      }
    );
  }

  Widget pageUI() {
    return null;
  }

  /*Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: AppColors.mainColor,
      automaticallyImplyLeading: true,
      title: Text(""
          "A2iS",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Icon(Icons.notifications_none, color: Colors.white,),
        SizedBox(width: 10,),
        Icon(Icons.shopping_cart, color: Colors.white,),
        SizedBox(width: 10,)
      ],
    );
  }*/
}
