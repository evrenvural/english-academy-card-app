import 'package:english_academy/helpers/my_size.dart';
import 'package:english_academy/init/theme.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Card build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 15.0,
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