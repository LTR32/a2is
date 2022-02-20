import 'package:a2is/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class iconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const iconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
