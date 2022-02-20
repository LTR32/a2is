import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/big_text.dart';
import 'a2is_page_body.dart';

class MainA2iSPage extends StatefulWidget {
  const MainA2iSPage({Key? key}) : super(key: key);

  @override
  _MainA2iSPageState createState() => _MainA2iSPageState();
}

class _MainA2iSPageState extends State<MainA2iSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 45),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Louis Doussineau",
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //body
          A2iSPageBody(),
        ],
      ),
    );
  }
}
