import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:flutter/material.dart';

class BoatTextField extends StatelessWidget {
  const BoatTextField(
      {super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: SizedBox(
        height: 45,
        child: Center(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: CustomFunctions.style(
                fontWeight: FontWeight.w500,
                size: 14,
                color: Theme.of(context).colorScheme.primary),
            decoration: InputDecoration(
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
            ),
          ),
        ),
      ),
    );
  }
}
