import 'package:chatboat/view/widgets/button_loading.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key, this.isWeb = false, required this.formKey});

  final bool isWeb;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCtrl>(builder: (pCtrl) {
      return pCtrl.isEditLoading
          ? const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: ButtonClickLoading(),
            )
          : MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (pCtrl.initName != pCtrl.nameController.text ||
                        pCtrl.initEmail != pCtrl.emailController.text ||
                        pCtrl.initNumber != pCtrl.numberController.text ||
                        pCtrl.selectedProfileImg != null)
                    ? () async {
                        if (formKey.currentState!.validate()) {
                          await pCtrl.editProfileValues(context);
                        }
                      }
                    : () {
                        boatSnackBar(
                            text: 'Error',
                            message: 'Make Any Changes',
                            ctx: context);
                      },
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(bottom: 15),
                  duration: AppDurations.boatDuration,
                  height: 37,
                  width: isWeb ? context.width / 4 : context.width / 2,
                  decoration: BoxDecoration(
                    color: (pCtrl.initName != pCtrl.nameController.text ||
                            pCtrl.initEmail != pCtrl.emailController.text ||
                            pCtrl.initNumber != pCtrl.numberController.text ||
                            pCtrl.selectedProfileImg != null)
                        ? AppColors.button
                        : AppColors.greyColor,
                    borderRadius: AppSizes.radius10,
                  ),
                  child: Center(
                    child: Text(
                      'UPDATE',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
