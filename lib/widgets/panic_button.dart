import 'package:flutter/material.dart';
import 'package:easy/values/values.dart';

// ignore: must_be_immutable
class PanicButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final BoxDecoration decoration;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final GestureTapCallback onTap;

  PanicButton(this.buttonText,
      {this.buttonWidth =80,
        this.buttonHeight = 80,
        this.decoration = Decorations.primaryButtonDecoration,
        this.buttonTextStyle = Styles.normalTextStyle,
        this.onTap,

      });


  @override
  Widget build(BuildContext context) {
    return InkWell(

      borderRadius: BorderRadius.all(Radius.circular(40)),


      onTap: onTap,
      child: Container(

        width: buttonWidth,
        height: buttonHeight,
//        margin: EdgeInsets.only(bottom: 57),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(

              buttonText,
              textAlign: TextAlign.center,
              style: buttonTextStyle,
            ),

          ],
        ),
      ),
    );
  }
}
