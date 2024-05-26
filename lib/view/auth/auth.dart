import 'package:chatboat/view/auth/forgot_password.dart';
import 'package:chatboat/view/auth/phone_auth.dart';
import 'package:chatboat/view/home/home.dart';
import 'package:chatboat/view/widgets/button_loading.dart';
import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height / 2,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/images/login_header.png',
              ),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            )
                // gradient: LinearGradient(
                //   colors: [
                //     Color.fromARGB(231, 33, 149, 243),
                //     Color.fromARGB(231, 104, 58, 183)
                //   ],
                // ),
                ),
          ),
          Align(
            alignment: Alignment.center,
            child: GetBuilder<LoginController>(
              builder: (loginCtrl) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: AppDurations.minDuration,
                        constraints: BoxConstraints(
                            maxWidth: context.width < 502 ? 300 : 400,
                            maxHeight: loginCtrl.isSignUp ? 480 : 420),
                        decoration: BoxDecoration(
                          borderRadius: AppSizes.radius10,
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.greyColor,
                                blurRadius: 0.1,
                                spreadRadius: 0.1,
                                blurStyle: BlurStyle.outer)
                          ],
                        ),
                        child: AnimationLimiter(
                          child: Column(
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    loginCtrl.isSignUp ? 'SignUp' : 'Login',
                                    style: CustomFunctions.style(
                                        fontWeight: FontWeight.w600, size: 23),
                                  ),
                                ),
                                context.isPhone
                                    ? const SizedBox()
                                    : Image.network(
                                        'assets/gif/boat-unscreen.gif',
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 60,
                                      ),
                                loginCtrl.isSignUp
                                    ? BoatTextFormFieldLogin(
                                        controller: loginCtrl.userNameCtrl,
                                        label: 'Name',
                                        inputType: TextInputType.text,
                                      )
                                    : const SizedBox(),
                                loginCtrl.isSignUp
                                    ? AppSizes.minHeight
                                    : const SizedBox(),
                                BoatTextFormFieldLogin(
                                  controller: loginCtrl.emailCtrl,
                                  label: 'Email',
                                  isUsername: true,
                                  inputType: TextInputType.emailAddress,
                                ),
                                AppSizes.minHeight,
                                BoatTextFormFieldLogin(
                                  controller: loginCtrl.passworldCtrl,
                                  label: 'Password',
                                  isPassword: true,
                                ),
                                loginCtrl.isSignUp == false
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 22.0),
                                          child: GestureDetector(
                                            onTap: () =>
                                                forgotPasswordDialog(context),
                                            child: Text(
                                              'Forgot Password?',
                                              style: CustomFunctions.style(
                                                  fontWeight: FontWeight.w600,
                                                  size: 13,
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: SizedBox(
                                    width: 200,
                                    child: loginCtrl.isSignInLoading ||
                                            loginCtrl.isSignUpLoading
                                        ? const ButtonClickLoading()
                                        : ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            AppSizes.radius10)),
                                                animationDuration:
                                                    const Duration(seconds: 1)),
                                            onPressed: () async {
                                              await handleAuth(
                                                  loginCtrl, context);
                                            },
                                            child: Text(loginCtrl.isSignUp
                                                ? 'SignUp'
                                                : 'Login'),
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    children: [
                                      const Expanded(child: Divider()),
                                      Text(
                                        'Or SignUp Using',
                                        style: CustomFunctions.style(
                                            fontWeight: FontWeight.w500,
                                            size: 13,
                                            color: AppColors.greyColor),
                                      ),
                                      const Expanded(child: Divider())
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterSocialButton(
                                      buttonType: ButtonType.google,
                                      mini: true,
                                      onTap: () async {
                                        await loginCtrl.signInWithGoogle(
                                            context: context);
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: context.isPhone ? 10 : 0),
                                      child: FlutterSocialButton(
                                        buttonType: ButtonType.facebook,
                                        mini: true,
                                        onTap: () async {
                                          await loginCtrl.facebookAuth();
                                        },
                                      ),
                                    ),
                                    FlutterSocialButton(
                                      buttonType: ButtonType.phone,
                                      mini: true,
                                      onTap: () {
                                        phoneAuth(context);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      loginCtrl.isSignUp
                          ? GestureDetector(
                              onTap: () {
                                loginCtrl.clearControllers();
                                loginCtrl.signUpState();
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Have An Account ? ",
                                  style: CustomFunctions.style(
                                      fontWeight: FontWeight.w500,
                                      size: 14,
                                      color: AppColors.greyColor),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: CustomFunctions.style(
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                loginCtrl.clearControllers();
                                loginCtrl.signUpState();
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't Have An Account ? ",
                                  style: CustomFunctions.style(
                                      fontWeight: FontWeight.w500,
                                      size: 14,
                                      color: AppColors.greyColor),
                                  children: [
                                    TextSpan(
                                      text: 'SignUp',
                                      style: CustomFunctions.style(
                                          fontWeight: FontWeight.w600,
                                          size: 14,
                                          color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleAuth(LoginController ctrl, context) async {
    if (ctrl.isSignUp) {
      ctrl.user = await ctrl.signUpWithEmailAndPassword(context);
      if (ctrl.user != null) {
        await Get.offAll(() => const HomeView())
            ?.then((value) => ctrl.clearControllers());
      } else {
        boatSnackBar(message: 'Something Wrong', text: 'Failed', ctx: context);
      }
    } else {
      if (ctrl.emailCtrl.text.isEmpty || ctrl.passworldCtrl.text.isEmpty) {
        return boatSnackBar(
            message: 'Enter required fields', text: 'Required', ctx: context);
      } else {
        ctrl.user = await ctrl.signInWithEmailAndPasswords(context);
        if (ctrl.user != null) {
          await Get.offAll(() => const HomeView())
              ?.then((value) => ctrl.clearControllers());
        } else {
          boatSnackBar(
              message: 'Something Wrong', text: 'Failed', ctx: context);
        }
      }
    }
  }
}