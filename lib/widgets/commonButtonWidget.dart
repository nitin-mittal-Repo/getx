
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_model/utils/responsive.dart';
import '../utils/appAssets.dart';
import '../utils/appTheme.dart';
import 'commonTextWidget.dart';

class CommonButtonWidget extends StatefulWidget {
  final String? title;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? fontSize;
  final double? borderRadius; // Optional border radius parameter
  final Color? firstGradientColor;
  final Color? secondGradientColor;
  final bool showIcon;
  final double? height;
  final double? width;

  const CommonButtonWidget({
    this.title,
    required this.onPressed,
    this.isLoading = false,
    this.fontSize,
    this.borderRadius,
    this.firstGradientColor,
    this.secondGradientColor,
    this.height,
    this.width,
    this.showIcon = true,
    super.key,
  });

  @override
  State<CommonButtonWidget> createState() => _CommonButtonWidgetState();
}

class _CommonButtonWidgetState extends State<CommonButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed, // Disable onTap if isLoading is true
      child: Container(
        width: widget.width??MediaQuery.of(context).size.width,
        height: widget.height ??MediaQuery.of(context).size.height * .08,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.firstGradientColor??ThemeProvider.blackColor,
              widget.secondGradientColor??ThemeProvider.blackColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50), // Use custom or default radius
          boxShadow: [
            BoxShadow(
              color: ThemeProvider.blackColor.withOpacity(0.6),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
          child: widget.isLoading
              ? SizedBox(
            width: Get.width,
            child: Center(
              child: CircularProgressIndicator(
                color: ThemeProvider.whiteColor,
              ),
            ),
          )
              :
          Row(
            mainAxisAlignment: widget.showIcon
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center, // Align text if no icon
            children: [
              CommonTextWidget(
                textAlign: TextAlign.center,
                heading: widget.title!.tr,
                fontSize: widget.fontSize ?? Responsive.responsiveFontSize(context, 18.sp),
                color: ThemeProvider.whiteColor,
                fontFamily: 'regular',
              ),

              if (widget.showIcon)
                SvgPicture.asset(AssetPath.arrowNext),

            ],
          ),
        ),
      ),
    );
  }

}