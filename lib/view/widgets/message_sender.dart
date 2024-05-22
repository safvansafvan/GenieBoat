// ignore_for_file: use_build_context_synchronously
import 'package:chatboat/view/widgets/choose_image_source.dart';
import 'package:chatboat/view/widgets/lottie_view.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/boat_controller.dart';
import 'package:chatboat/view_model/constant.dart';
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
              _buildAudioButton(chatCtrl, context),
              if (chatCtrl.isRecoreding)
                lottieView(path: 'assets/lotties/recording.json'),
              if (!chatCtrl.isRecoreding) _buildMessageInput(chatCtrl, context),
              if (chatCtrl.isRecoreding) const Spacer(),
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
              borderRadius: radius10,
              color: bgColor,
            ),
            child: chatCtrl.selectedImage == null
                ? Icon(Icons.upload_file, color: blackColor)
                : null,
          ),
          if (chatCtrl.selectedImage != null)
            Positioned(
              top: -6,
              right: -5,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: whiteColor,
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

  Widget _buildAudioButton(BoatChatCtrl chatCtrl, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isPhone ? 5 : 20.0),
      child: InkWell(
        onTap: () async {
          if (chatCtrl.recordedAudio == null) {
            if (chatCtrl.isRecoreding && chatCtrl.recordedAudio == null) {
              await chatCtrl.stopRecord(context);
            } else {
              await chatCtrl.recordAudio();
            }
          } else {
            await chatCtrl.playRecordedAudio(context);
          }
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(borderRadius: radius10, color: bgColor),
          child: Icon(icon(chatCtrl), color: blackColor),
        ),
      ),
    );
  }

  Widget _buildMessageInput(BoatChatCtrl chatCtrl, BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          onTap: () {
            FocusScope.of(context).requestFocus(focusNode);
          },
          focusNode: focusNode,
          keyboardType: TextInputType.name,
          cursorColor: blackColor,
          controller: chatCtrl.questionCtrl,
          maxLength: null,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            hintStyle: boatTextStyle(
                fontWeight: FontWeight.w500, size: 14, color: blackColor),
            hintText: 'Message ChatGenie....',
            fillColor: bgColor,
            enabled: true,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: radius10, borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: radius10, borderSide: BorderSide.none),
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
      child: Padding(
        padding: EdgeInsets.only(left: context.isPhone ? 5 : 20.0),
        child: Container(
          height: 40,
          width: 40,
          decoration:
              BoxDecoration(borderRadius: radius10, color: Colors.orange),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Image.asset(
              'assets/images/send.png',
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  IconData icon(BoatChatCtrl bc) {
    if (bc.isRecoreding == true) {
      return Icons.close;
    }
    if (bc.isRecoreding == false && bc.recordedAudio == null) {
      return Icons.mic_none_outlined;
    }
    return Icons.play_arrow;
  }
}
