import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatTextFormFieldLogin extends StatelessWidget {
  const BoatTextFormFieldLogin({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.inputType,
    this.isUsername = false,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool isUsername;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 68),
          child: Center(
            child: TextFormField(
              keyboardType: inputType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              cursorColor: blackColor,
              style: boatTextStyle(fontWeight: FontWeight.w500, size: 16),
              maxLengthEnforcement: MaxLengthEnforcement.none,
              decoration: InputDecoration(
                errorStyle: boatTextStyle(
                    fontWeight: FontWeight.w500, size: 14, color: redColor),
                suffixIcon: isPassword == true
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                            onPressed: () {
                              loginCtrl.obscureState();
                            },
                            icon: Icon(
                                loginCtrl.obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: greyColor)),
                      )
                    : null,
                label: Text(label),
                labelStyle: boatTextStyle(
                    fontWeight: FontWeight.w500, size: 18, color: greyColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: greyColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: greyColor)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: redColor)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: redColor)),
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
                  if (EmailValidator.validate(value)) {
                    return 'Enter Valid Email';
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
}
