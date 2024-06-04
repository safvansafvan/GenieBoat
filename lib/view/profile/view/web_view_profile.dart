import 'package:chatboat/view/widgets/boat_animate.dart';
import 'package:chatboat/view/widgets/boat_text_field.dart';
import 'package:chatboat/view/widgets/choose_image_source.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebViewProfile extends StatelessWidget {
  const WebViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final pc = Get.find<ProfileCtrl>();
    return Scaffold(
      body: BoatAnimate(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PROFILE',
                style: CustomFunctions.style(
                  fontWeight: FontWeight.w600,
                  size: 25,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Card(
                child: Container(
                  height: context.height - 300,
                  width: context.width - 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.bgColor),
                    borderRadius: AppSizes.radius10,
                  ),
                  child: Row(
                    children: [
                      GetBuilder<ProfileCtrl>(builder: (pCtrl) {
                        return Container(
                          margin: const EdgeInsets.all(20),
                          height: context.height - 300,
                          width: context.width / 2 - 100,
                          decoration: BoxDecoration(
                            borderRadius: AppSizes.radius10,
                            image: pCtrl.selectedProfileImg == null
                                ? const DecorationImage(
                                    image:
                                        AssetImage('assets/images/person.jpg'),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high)
                                : DecorationImage(
                                    image:
                                        MemoryImage(pCtrl.selectedProfileImg!),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: IconButton(
                                  onPressed: () {
                                    chooseImageSource(
                                        context: context, isPorfile: true);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      Expanded(
                          child: Column(
                        children: [
                          AppSizes.height20,
                          BoatTextField(
                              controller: pc.nameController, label: 'Name'),
                          BoatTextField(
                              controller: pc.emailController, label: 'Email'),
                          BoatTextField(
                              controller: pc.numberController, label: 'Number'),
                          const Spacer(),
                          AnimatedContainer(
                            margin: const EdgeInsets.only(bottom: 20),
                            duration: AppDurations.boatDuration,
                            height: 45,
                            width: context.width / 4,
                            decoration: BoxDecoration(
                              color: AppColors.button,
                              borderRadius: AppSizes.radius10,
                            ),
                            child: Center(
                              child: Text(
                                'UPDATE',
                                style: CustomFunctions.style(
                                    fontWeight: FontWeight.w600,
                                    size: 18,
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
