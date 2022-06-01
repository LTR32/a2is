// @dart=2.9

import 'package:a2is/provider/loader_provider.dart';
import 'package:a2is/utils/ProgressHUD.dart';
import 'package:a2is/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage2 extends StatefulWidget {
  BasePage2({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage2> extends State<T> {
  bool isApiCallProcess = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>
      ( builder: (context, loaderModel, child) {
      return Scaffold(
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
}
