import 'package:chatboat/view_model/constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CredrDropDown extends StatefulWidget {
  const CredrDropDown(
      {super.key, required this.hintText, this.width, this.isCheck1 = false});

  final String hintText;
  final double? width;

  final bool isCheck1;

  @override
  State<CredrDropDown> createState() => _CredrDropDownState();
}

class _CredrDropDownState extends State<CredrDropDown> {
  String? selectedValue;
  var item = {'Dark', 'White'};
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        autofocus: true,
        isExpanded: true,
        hint: Text(
          widget.hintText,
          style: boatTextStyle(
              fontWeight: FontWeight.w500, size: 15, color: blackColor),
          overflow: TextOverflow.ellipsis,
        ),
        items: item
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: boatTextStyle(size: 15, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {},
        buttonStyleData: ButtonStyleData(
          height: 47.5,
          width: widget.width,
          padding: const EdgeInsets.only(left: 12, right: 8),
          decoration: BoxDecoration(borderRadius: radius5),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down, size: 24),
        ),
        dropdownStyleData: DropdownStyleData(
          width: 223,
          maxHeight: 200,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
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
  }
}
