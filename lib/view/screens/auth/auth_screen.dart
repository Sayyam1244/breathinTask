import 'dart:ui';

import 'package:breathin/core/utils/images.dart';
import 'package:breathin/core/utils/validator.dart';
import 'package:breathin/imports.dart';
import 'package:breathin/view/common/custom_button.dart';
import 'package:breathin/view/common/custom_textfield.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.authBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
          child: const AuthForm(),
        ),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isObscure = true;
  bool termsAccpeted = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: transparent,
      body: ListView(
        padding: paddingDefault,
        children: [
          (mediaQuery.padding.top + 50).verticalSpace,
          Text('welcome'.tr, style: headlineMedium(context)),
          4.verticalSpace,
          Text('enter_details'.tr, style: bodyLarge(context)),
          60.verticalSpace,
          CustomTextField(
            validator: Validators.emailValidator,
            labelText: 'email'.tr,
            hintText: 'example_email'.tr,
          ),
          20.verticalSpace,
          CustomTextField(
            validator: Validators.passwordValidator,
            obscureText: isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20.sp,
                color: context.theme.colorScheme.onBackground,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
            labelText: 'password'.tr,
            hintText: 'password_hint'.tr,
          ),
          12.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'forgot_password'.tr,
              style: bodyMedium(context).copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ),
          26.verticalSpace,
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    termsAccpeted = !termsAccpeted;
                  });
                },
                child: Icon(
                  termsAccpeted
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined,
                  color: context.theme.colorScheme.onBackground,
                ),
              ),
              8.horizontalSpace,
              Text(
                'accept_terms'.tr,
                style: bodyMedium(context).copyWith(
                  color: context.theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
          22.verticalSpace,
          CustomButton(
            text: 'continue'.tr,
            onTap: () {
              if (formKey.currentState?.validate() ?? false) {}
            },
          ),
        ],
      ),
    );
  }
}
