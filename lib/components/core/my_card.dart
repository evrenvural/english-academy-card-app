import 'package:flutter/material.dart';

import '../../helpers/my_size.dart';
import '../../init/theme.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key key, this.elevation, @required this.child})
      : super(key: key);

  final Widget child;
  final double elevation;

  @override
  Card build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: elevation != null ? elevation : 15.0,
      child: buildContainer(context),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      width: MySize.fullWidth(context),
      height: MySize.fullHeight(context),
      decoration: BoxDecoration(
        color: MyColors.WHITE2,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          buildLogo(context),
          child == null ? Container() : child,
        ],
      ),
    );
  }

  Positioned buildLogo(BuildContext context) {
    return Positioned(
      left: MySize.percentWidth(context, 0.04),
      bottom: MySize.percentHeight(context, 0.02),
      child: Image(
        width: 60,
        image: AssetImage('lib/assets/ida_logo.png'),
      ),
    );
  }
}
