
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_model/utils/appTheme.dart';

class CommonTextWidget extends StatelessWidget {
  final String heading;
  final String fontFamily;
  final double fontSize;
  final double lineHeight;
  final Color color;
  final double letterSpacing;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final FontWeight? fontWeight;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;
  final int? maxLine;
  final bool textShadow;


  const CommonTextWidget({
    super.key,
    this.fontStyle = FontStyle.normal,
    required this.heading,
    this.textDecoration = TextDecoration.none,
    this.fontFamily = 'regular',
    required this.fontSize,
    required this.color,
    this.letterSpacing = 0,
    this.lineHeight = 1,
    this.fontWeight,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.visible,
    this.maxLine = 1,
    this.textShadow = false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        fontStyle: fontStyle,
        decoration: textDecoration,
        fontFamily: fontFamily,
        fontWeight:fontWeight??FontWeight.w600,
        height: lineHeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        color: color,

        shadows: textShadow ? [
          Shadow(
            blurRadius: 3.0,
            color: ThemeProvider.blackColor.withOpacity(.5),
            offset: Offset(3, 3),
          ),
        ] : null,
      ),
    );
  }
}
