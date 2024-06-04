import 'package:chatboat/view/widgets/boat_text_field.dart';
import 'package:chatboat/view/widgets/choose_image_source.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class MobileViewProfile extends StatelessWidget {
  const MobileViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final pc = Get.find<ProfileCtrl>();
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
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
                              child: pCtrl.selectedProfileImg == null
                                  ? const CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'assets/images/person.jpg'),
                                    )
                                  : CircleAvatar(
                                      radius: 40,
                                      backgroundImage: MemoryImage(
                                          pCtrl.selectedProfileImg!),
                                    ),
                            ),
                            Positioned(
                              top: 15,
                              right: 0,
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
                    BoatTextField(controller: pc.nameController, label: 'Name'),
                    BoatTextField(
                        controller: pc.emailController, label: 'Email'),
                    BoatTextField(
                        controller: pc.numberController, label: 'Number'),
                    const SizedBox(height: 20),
                    AnimatedContainer(
                      margin: const EdgeInsets.only(bottom: 15),
                      duration: AppDurations.boatDuration,
                      height: 40,
                      width: context.width / 2,
                      decoration: BoxDecoration(
                        color: AppColors.button,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
