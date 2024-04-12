import 'package:flutter/material.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';
import 'package:uc_flutter_task/core/utils/extensions.dart';
import 'package:uc_flutter_task/core/utils/helpers.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.textColor,
    this.buttonColor,
    this.textSize,
    this.textWeight,
    this.width,
    this.height,
  });
  final Function()? onTap;
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final double? textSize;
  final FontWeight? textWeight;
  final bool isLoading;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? context.width,
        height: height ?? context.height * 0.07,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.blackColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isLoading
              ? Helpers.getProgressLoader()
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? AppColors.whiteColor,
                    fontSize: textSize ?? 16,
                    fontWeight: textWeight ?? FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
