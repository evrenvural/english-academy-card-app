import '../../init/theme.dart';
import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  const MyRaisedButton({Key key, @required this.onPressed, this.child})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: MyColors.BLUE,
      textColor: MyColors.WHITE,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: MyColors.BLUE)),
      onPressed: onPressed,
      child: child,
    );
  }
}
