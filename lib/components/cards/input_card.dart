import 'package:flutter/material.dart';

import '../../helpers/my_size.dart';
import '../../init/theme.dart';
import '../core/my_card.dart';
import '../core/my_raised_button.dart';

class InputCard extends StatefulWidget {
  const InputCard({Key key, @required this.onSubmit}) : super(key: key);

  final ValueChanged<String> onSubmit;

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  String inputValue = "";

  void handleChange(value) {
    setState(() {
      inputValue = value;
    });
  }

  void handleSubmit() {
    widget.onSubmit(inputValue.trim());
  }

  @override
  MyCard build(BuildContext context) {
    return MyCard(
      child: Stack(
          children: [buildInputContainer(context), buildSubmitButton(context)]),
    );
  }

  Center buildInputContainer(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MySize.percentWidth(context, 0.06),
        ),
        child: buildInput(context),
      ),
    );
  }

  TextFormField buildInput(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      maxLength: 20,
      style:
          Theme.of(context).textTheme.headline1.copyWith(color: MyColors.BLUE),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.BLUE),
        ),
      ),
      onChanged: handleChange,
      initialValue: inputValue,
    );
  }

  Positioned buildSubmitButton(BuildContext context) {
    return Positioned(
        right: MySize.percentWidth(context, 0.04),
        bottom: MySize.percentHeight(context, 0.02),
        child: MyRaisedButton(
          onPressed: handleSubmit,
          child: Text("Gönder"),
        ));
  }
}
