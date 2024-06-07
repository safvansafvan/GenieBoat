import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoatTextField extends StatelessWidget {
  const BoatTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.isNumber = false,
      this.isName = false,
      this.isEmail = false});
  final TextEditingController controller;
  final String label;
  final bool isNumber;
  final bool isName;
  final bool isEmail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: SizedBox(
        height: 45,
        child: Center(
          child: GetBuilder<ProfileCtrl>(builder: (pc) {
            return TextFormField(
              readOnly: isNumber || isName ? false : true,
              inputFormatters: isNumber
                  ? [LengthLimitingTextInputFormatter(10)]
                  : [LengthLimitingTextInputFormatter(20)],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              cursorColor: Theme.of(context).colorScheme.primary,
              style: CustomFunctions.style(
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                errorStyle: CustomFunctions.style(
                    fontWeight: FontWeight.w500,
                    size: 0,
                    color: AppColors.redColor),
                contentPadding: const EdgeInsets.only(left: 10),
                label: Text(label),
                labelStyle: CustomFunctions.style(
                    fontWeight: FontWeight.w500,
                    size: 14,
                    color: AppColors.greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.borderGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.borderGrey),
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
              validator: (value) {
                if (isName) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Name';
                  }
                  if (value.length < 4) {
                    return 'Minimum 7 Letters';
                  }
                }

                if (isNumber && pc.numberController.text.isNotEmpty) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Number';
                  }
                  if (value.length < 10) {
                    return 'Enter Valid Number';
                  }
                  if (pc.numberController.text.length >= 10) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }

                return null;
              },
            );
          }),
        ),
      ),
    );
  }
}
