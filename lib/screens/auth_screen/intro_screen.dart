import 'package:a2is/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../utils/colors.dart';

class IntroPage extends StatefulWidget {
  final UserRepositories userRepositories;
  IntroPage({required Key key, required this.userRepositories}): super (key: key);

  @override
  _introPageState createState() => _introPageState(userRepositories);
}

class _introPageState extends State<IntroPage> {
  final UserRepositories userRepositories;
  _introPageState(this.userRepositories);

  bool clicked = false;

  void afterIntroComplete (){
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [

    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          Text('FREE GIFT', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600
          ),),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 3.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(10.0)
            ),
          )
        ],
      ),
      body: "Free gifts with purchase. Offer free gifts like a gift wrap, ....",
      image: Center(
        child: SvgPicture.asset('asset/icons/gift.svg'),
      )
    ),
    PageViewModel(
        titleWidget: Column(
          children: <Widget>[
            Text('FREE GIFT', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600
            ),),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 3.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10.0)
              ),
            )
          ],
        ),
        body: "Free gifts with purchase. Offer free gifts like a gift wrap, ....",
        image: Center(
          child: SvgPicture.asset('asset/icons/gift.svg'),
        )
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return clicked ? Container() : IntroductionScreen(
      pages: pages,
      onDone: () {
        afterIntroComplete();
      },
      onSkip: (){
        afterIntroComplete();
      },
      showSkipButton: true,
      skip: Text('Skip', style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey
      ),),
      next: Icon(Icons.navigate_next),
      done: Text('Done', style: TextStyle(
        fontWeight: FontWeight.w600
      ),),
      dotsDecorator: DotsDecorator(
        size: Size.square(7.0),
        activeSize: Size(20.0, 5.0),
        activeColor: AppColors.mainColor,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(
          horizontal: 3.0
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        )
      ),
    );
  }
}
