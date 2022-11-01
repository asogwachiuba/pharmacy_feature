import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_fontSize.dart';

class CustomButton extends StatelessWidget {
  final double buttonLength;
  final bool isColored;
  final String buttonName;
  final IconData? buttonIcon;
  const CustomButton({
    required this.buttonLength,
    required this.buttonName,
    this.buttonIcon,
    this.isColored = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonLength,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.darkPurple, width: 2),
          gradient: isColored == true ? LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                CustomColors.darkPurple,
                CustomColors.lightPurple
              ]) : null,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
             buttonIcon != null ? Icon(buttonIcon, color: Colors.white,) : Container(),
              Text(
                buttonName,
                style: TextStyle(
                    color: isColored == true ? Colors.white : CustomColors.darkPurple, fontSize: CustomFontSize.small),
              ),
            ],
          )),
    );
  }
}
