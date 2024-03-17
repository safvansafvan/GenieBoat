import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatTextFormFieldLogin extends StatelessWidget {
  const BoatTextFormFieldLogin({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.isUsername = false,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool isUsername;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
      child: Center(
        child: TextFormField(
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
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off, color: greyColor)),
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
          // obscureText: isPassword == true ? ctrl.isObscureText : false,
          validator: (value) {
            if (isPassword) {
              if (value == null || value.isEmpty) {
                return 'Enter Password';
              }
            }
            if (isUsername) {
              if (value == null || value.isEmpty) {
                return 'Enter Username';
              }
            }

            return null;
          },
        ),
      ),
    );
  }
}
