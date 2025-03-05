// ignore_for_file: library_private_types_in_public_api

import 'package:breathin/imports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText, hintText, labeImage;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final double? hintSize;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final Color? textcolor;

  const CustomTextField({
    this.textcolor,
    this.controller,
    this.hintText,
    this.labeImage,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.padding,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.enabledBorder,
    this.focusBorder,
    this.hintSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: spacingExtraSmall),
            child: Text(
              labelText!,
              style: bodyLarge(context).copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onSaved: onSaved,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onTap: onTap,
          decoration: InputDecoration(
            enabledBorder: enabledBorder,
            focusedBorder: focusBorder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, size: 20.sp, color: context.theme.hintColor)
                : null,
            hintText: hintText,
            hintStyle: bodySmall(context).copyWith(
              color: Theme.of(context).hintColor,
              fontSize: hintSize,
            ),
            suffixIcon: suffixIcon,
          ),
          style: bodyMedium(context).copyWith(
            color: textcolor,
          ),
        ),
      ],
    );
  }
}
