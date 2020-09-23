import 'package:english_academy/helpers/my_size.dart';
import 'package:english_academy/init/theme.dart';
import 'package:flutter/material.dart';

class TextProgressLinearIndicator extends StatelessWidget {
  const TextProgressLinearIndicator({Key key, this.valueColor, this.showText})
      : super(key: key);

  final Color valueColor;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: LinearProgressIndicator(
            minHeight: MySize.percentHeight(context, 0.015),
            backgroundColor: MyColors.WHITE3,
            valueColor: AlwaysStoppedAnimation<Color>(
                valueColor != null ? valueColor : MyColors.BLUE),
          ),
        ),
        SizedBox(height: 13),
        showText == null || showText
            ? Text("10/20", style: Theme.of(context).textTheme.bodyText1)
            : Container(),
      ],
    );
  }
}
