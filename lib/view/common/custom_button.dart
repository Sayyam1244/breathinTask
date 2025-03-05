import 'dart:developer';

import 'package:breathin/imports.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.text = '',
    this.backgroundColor,
    this.textColor,
    this.height,
    this.borderRadius = 6,
  });

  final VoidCallback? onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    log(context.theme.colorScheme.primary.toString());
    return Container(
      height: height ?? 54.sp,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.sp),
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: bodyLarge(context).copyWith(
              fontWeight: FontWeight.w700,
              color: textColor ?? context.theme.colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
