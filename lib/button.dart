import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? size;
  final String? theme;
  final String text;
  final Function onPressed;
  const Button({
    super.key,
    this.size,
    this.theme,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 4 - 10;
    late Color buttonColor;
    Color? textColor;
    if (theme == "secondary") {
      buttonColor = const Color(0xffa6a6a6);
      textColor = const Color(0xff060606);
    } else if (theme == "accent") {
      buttonColor = const Color(0xffffc107);
    } else {
      buttonColor = const Color(0xff333333);
    }

    return Expanded(
        flex: size == "double" ? 2 : 1,
        child: InkWell(
          onTap: () => onPressed(),
          child: Container(
              alignment:
                  size == "double" ? Alignment.centerLeft : Alignment.center,
              padding: size == "double"
                  ? const EdgeInsets.only(left: 40)
                  : EdgeInsets.zero,
              height: buttonWidth,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(buttonWidth),
              ),
              child: Text(
                text,
                style:
                    TextStyle(color: textColor ?? Colors.white, fontSize: 24),
              )),
        ));
  }
}
