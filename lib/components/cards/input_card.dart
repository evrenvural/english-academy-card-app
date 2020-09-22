import 'package:english_academy/components/core/my_card.dart';
import 'package:english_academy/helpers/my_size.dart';
import 'package:english_academy/init/theme.dart';
import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  const InputCard({Key key}) : super(key: key);

  @override
  MyCard build(BuildContext context) {
    return MyCard(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MySize.percentWidth(context, 0.06),
          ),
          child: buildInput(context),
        ),
      ),
    );
  }

  TextFormField buildInput(BuildContext context) {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
        labelText: 'Cevap',
        labelStyle: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
