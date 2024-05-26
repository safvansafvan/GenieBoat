// ignore_for_file: use_build_context_synchronously

import 'package:chatboat/view/widgets/choose_image_source.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenieMessageSender extends StatelessWidget {
  const GenieMessageSender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.isPhone ? 10 : 25),
      child: GetBuilder<BoatChatCtrl>(
        builder: (chatCtrl) {
          return Row(
            children: [
              _buildImageSelector(context, chatCtrl),
              _buildMessageInput(chatCtrl, context),
              _buildSendButton(context, chatCtrl),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageSelector(BuildContext context, BoatChatCtrl chatCtrl) {
    return GestureDetector(
      onTap: () async {
        await chooseImageSource(context);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: (chatCtrl.selectedImage != null)
                  ? DecorationImage(
                      image: MemoryImage(chatCtrl.selectedImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
              borderRadius: AppSizes.radius10,
              color: AppColors.bgColor,
            ),
            child: chatCtrl.selectedImage == null
                ? Icon(Icons.upload_file, color: AppColors.blackColor)
                : null,
          ),
          if (chatCtrl.selectedImage != null)
            Positioned(
              top: -6,
              right: -5,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.whiteColor,
                child: Center(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        chatCtrl.clearSelectedImage();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BoatChatCtrl chatCtrl, BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 5, horizontal: context.isPhone ? 5 : 10),
        child: TextField(
          onTap: () {
            FocusScope.of(context).requestFocus(focusNode);
          },
          focusNode: focusNode,
          keyboardType: TextInputType.name,
          cursorColor: AppColors.blackColor,
          controller: chatCtrl.questionCtrl,
          maxLength: null,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            hintStyle: CustomFunctions.style(
                fontWeight: FontWeight.w500,
                size: 14,
                color: AppColors.blackColor),
            hintText: 'Message ChatGenie....',
            fillColor: AppColors.bgColor,
            enabled: true,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: AppSizes.radius10, borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: AppSizes.radius10, borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton(BuildContext context, BoatChatCtrl chatCtrl) {
    return GestureDetector(
      onTap: () async {
        if (chatCtrl.questionCtrl.text.isEmpty) {
          return boatSnackBar(
              text: 'Error', message: 'Enter Messages', ctx: context);
        }
        await chatCtrl.boatChatHandling(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: AppSizes.radius10, color: Colors.orange),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Image.asset(
            'assets/images/send.png',
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
