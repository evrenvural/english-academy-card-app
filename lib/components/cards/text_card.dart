import 'package:english_academy/components/core/my_raised_button.dart';
import 'package:flutter/material.dart';

import '../../helpers/my_size.dart';
import '../../init/theme.dart';
import '../core/my_card.dart';
import '../../helpers/extensions/widget_extension.dart';

class TextCard extends StatelessWidget {
  const TextCard(
      {Key key,
      @required this.text,
      this.isResponseTrue,
      this.onPressedNextButon,
      this.elevation})
      : super(key: key);

  final String text;
  final bool isResponseTrue;
  final VoidCallback onPressedNextButon;
  final double elevation;

  @override
  MyCard build(BuildContext context) {
    return MyCard(
      elevation: elevation,
      child: Stack(children: [
        buildResponseIconContainer(context),
        buildText(context),
        buildNextButton(context)
            .doesRender(isResponseTrue != null && onPressedNextButon != null)
      ]),
    );
  }

  Positioned buildResponseIconContainer(BuildContext context) {
    return Positioned(
        top: MySize.percentHeight(context, 0.02),
        right: MySize.percentWidth(context, 0.05),
        child: isResponseTrue != null ? buildIcon() : Container());
  }

  Icon buildIcon() {
    return Icon(
      isResponseTrue ? Icons.check_circle_outline : Icons.highlight_off,
      size: 24.0 * 3,
      color: isResponseTrue ? MyColors.GREEN : MyColors.RED,
    );
  }

  Center buildText(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Positioned buildNextButton(BuildContext context) {
    return Positioned(
      right: MySize.percentWidth(context, 0.04),
      bottom: MySize.percentHeight(context, 0.02),
      child: MyRaisedButton(
        onPressed: onPressedNextButon,
        child: Text("Sonraki"),
      ),
    );
  }
}
