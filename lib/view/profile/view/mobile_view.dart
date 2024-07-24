import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatboat/view/profile/view/widget/update_bttn.dart';
import 'package:chatboat/view/widgets/boat_text_field.dart';
import 'package:chatboat/view/widgets/choose_image_source.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class MobileViewProfile extends StatelessWidget {
  const MobileViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final pc = Get.find<ProfileCtrl>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.bgColor),
            borderRadius: AppSizes.radius10,
          ),
          child: AnimationLimiter(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: AnimationConfiguration.toStaggeredList(
                  duration: AppDurations.minDuration,
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 100.0,
                    child: FadeInAnimation(
                      curve: Easing.emphasizedDecelerate,
                      duration: AppDurations.boatDuration,
                      child: widget,
                    ),
                  ),
                  children: [
                    GetBuilder<ProfileCtrl>(
                      builder: (pCtrl) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: profileView(pCtrl)),
                            Positioned(
                              top: 15,
                              right: 7,
                              child: GestureDetector(
                                onTap: () {
                                  chooseImageSource(
                                      context: context, isPorfile: true);
                                },
                                child: const CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    AppSizes.height20,
                    Form(
                      child: Column(
                        children: [
                          BoatTextField(
                              controller: pc.nameController,
                              label: 'Name',
                              isName: true),
                          BoatTextField(
                              controller: pc.emailController,
                              label: 'Email',
                              isEmail: true),
                          BoatTextField(
                              controller: pc.numberController,
                              label: 'Number',
                              isNumber: true),
                        ],
                      ),
                    ),
                    if (pc.updatedCtrl.text.isNotEmpty)
                      Text(
                        "Last Updated : ${pc.updatedCtrl.text}",
                      ),
                    const SizedBox(height: 20),
                    UpdateButton(formKey: formKey),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget profileView(ProfileCtrl pc) {
    if (pc.profileDownloadedUrl.isNotEmpty) {
      return CircleAvatar(
        radius: 50,
        backgroundImage: CachedNetworkImageProvider(pc.profileDownloadedUrl),
      );
    }
    if (pc.selectedProfileImg == null && pc.selectedProfileImg == null) {
      return const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/person.jpg'),
      );
    }
    if (pc.selectedProfileImg != null) {
      return CircleAvatar(
        radius: 50,
        backgroundImage: MemoryImage(pc.selectedProfileImg!),
      );
    }
    return const SizedBox();
  }
}
