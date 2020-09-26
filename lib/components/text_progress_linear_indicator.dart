import 'package:flutter/material.dart';

import '../helpers/extensions/widget_extension.dart';
import '../helpers/my_size.dart';
import '../init/theme.dart';

class TextProgressLinearIndicator extends StatelessWidget {
  const TextProgressLinearIndicator(
      {Key key,
      this.valueColor,
      this.showText,
      @required this.value,
      @required this.fullValue})
      : super(key: key);

  final Color valueColor;
  final bool showText;
  final int value;
  final int fullValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: buildLinearProgressIndicator(context)),
        SizedBox(height: MySize.percentHeight(context, 0.02)),
        Text("$value/$fullValue", style: Theme.of(context).textTheme.bodyText1)
            .doesRender(showText == null || showText)
      ],
    );
  }

  LinearProgressIndicator buildLinearProgressIndicator(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: MySize.percentHeight(context, 0.015),
      backgroundColor: MyColors.WHITE3,
      valueColor: AlwaysStoppedAnimation<Color>(
          valueColor != null ? valueColor : MyColors.BLUE),
      value: value / fullValue,
    );
  }
}
