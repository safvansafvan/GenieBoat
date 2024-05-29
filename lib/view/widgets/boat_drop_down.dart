import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CredrDropDown extends StatefulWidget {
  const CredrDropDown({super.key, required this.hintText, this.width});

  final String hintText;
  final double? width;
  @override
  State<CredrDropDown> createState() => _CredrDropDownState();
}

class _CredrDropDownState extends State<CredrDropDown> {
  var item = {'Dark', 'Light', 'System'};
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobleController>(builder: (gctrl) {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          autofocus: true,
          isExpanded: true,
          style: CustomFunctions.style(
              fontWeight: FontWeight.w600,
              size: 15,
              color: AppColors.blackColor),
          hint: Text(
            widget.hintText,
            style: CustomFunctions.style(
                fontWeight: FontWeight.w500, size: 15, color: gctrl.focusColor),
            overflow: TextOverflow.ellipsis,
          ),
          items: item
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          value: gctrl.selectedValueDropDown,
          onChanged: (String? value) {
            gctrl.dropDownState(value ?? '');
            if (value == 'Dark') {
              gctrl.darkThemeState(true);
            } else if (value == 'Light') {
              gctrl.darkThemeState(false);
            } else {
              gctrl.systemThemeState(true);
            }
          },
          buttonStyleData: ButtonStyleData(
            height: 47.5,
            width: widget.width,
            padding: const EdgeInsets.only(left: 12, right: 8),
            decoration: BoxDecoration(borderRadius: AppSizes.radius5),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.arrow_drop_down, size: 24),
          ),
          dropdownStyleData: DropdownStyleData(
            width: 223,
            maxHeight: 200,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 48,
            padding: EdgeInsets.only(left: 18, right: 14),
          ),
        ),
      );
    });
  }
}
