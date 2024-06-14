import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatTextFormFieldLogin extends StatelessWidget {
  const BoatTextFormFieldLogin(
      {super.key,
      required this.label,
      required this.controller,
      this.inputType,
      this.isUsername = false,
      this.isPassword = false,
      this.isOtp = false,
      this.isNumber = false});

  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isUsername;
  final bool isNumber;
  final bool isOtp;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 68, minHeight: 50),
          child: Center(
            child: TextFormField(
              inputFormatters:
                  isNumber ? [LengthLimitingTextInputFormatter(10)] : [],
              focusNode: isNumber ? loginCtrl.numberFocus : null,
              keyboardType: inputType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              cursorColor: AppColors.blackColor,
              style:
                  CustomFunctions.style(fontWeight: FontWeight.w500, size: 16),
              maxLengthEnforcement: MaxLengthEnforcement.none,
              decoration: InputDecoration(
                errorStyle: CustomFunctions.style(
                    fontWeight: FontWeight.w500,
                    size: 10,
                    color: AppColors.redColor),
                suffixIcon: suffixWidget(loginCtrl, context),
                label: Text(label),
                labelStyle: CustomFunctions.style(
                    fontWeight: FontWeight.w500,
                    size: 14,
                    color: AppColors.greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.greyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.greyColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.redColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.redColor),
                ),
              ),
              obscureText:
                  isPassword == true ? loginCtrl.obscurePassword : false,
              validator: (value) {
                if (isPassword) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Password';
                  }
                  if (value.length < 7) {
                    return 'Minimum 7 Letters';
                  }
                }
                if (isUsername) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Enter Valid Email';
                  }
                }
                if (isNumber) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Number';
                  }
                  if (value.length < 10) {
                    return 'Enter Valid Number';
                  }
                  if (loginCtrl.numberCtrl.text.length >= 10) {
                    // loginCtrl.numberFocus?.unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }
                if (isOtp) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Otp';
                  }
                  if (value.length < 5) {
                    return 'Enter Valid Otp';
                  }
                  if (loginCtrl.otpCtrl.text.length == 6) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }

                return null;
              },
            ),
          ),
        ),
      );
    });
  }

  suffixWidget(LoginController loginCtrl, ctx) {
    if (isPassword) {
      return IconButton(
        onPressed: () {
          loginCtrl.obscureState();
        },
        icon: Icon(
            loginCtrl.obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: AppColors.greyColor),
      );
    } else if (isNumber == true &&
        loginCtrl.isVerifyLoading == false &&
        loginCtrl.numberCtrl.text.length >= 10) {
      return TextButton(
        onPressed: () async {
          if (loginCtrl.numberCtrl.text.isEmpty) {
            return boatSnackBar(
                text: 'Error', message: 'Enter Phone Number', ctx: ctx);
          }
          await loginCtrl.verifyPhoneNum(ctx);
        },
        child: Text(
          'Verify',
          style: CustomFunctions.style(
              fontWeight: FontWeight.w500, size: 14, color: AppColors.redColor),
        ),
      );
    } else if (loginCtrl.isVerifyLoading == true && isNumber == true) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(strokeWidth: 1.5),
        ),
      );
    }
  }
}
