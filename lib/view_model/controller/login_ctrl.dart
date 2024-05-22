// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:chatboat/view/auth/login.dart';
import 'package:chatboat/view/home/home.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController forgotEmailCtrl = TextEditingController();
  TextEditingController passworldCtrl = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController otpCtrl = TextEditingController();
  FocusNode? numberFocus;
  bool obscurePassword = true;
  bool isSignUp = false;
  User? user;

  void obscureState() {
    obscurePassword = !obscurePassword;
    update();
  }

  void signUpState() {
    isSignUp = !isSignUp;
    update();
  }

  void clearControllers() {
    emailCtrl.clear();
    passworldCtrl.clear();
    userNameCtrl.clear();
  }

//*************************** phone auth view ********************************************************************
  String countryCode = '+91';
  String verifyId = '';
  bool isVerifyLoading = false;

  Future<void> verifyPhoneNum(context) async {
    isVerifyLoading = true;
    update();
    log(numberCtrl.text, name: isVerifyLoading.toString());
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode + numberCtrl.text,
        codeSent: (String verificationId, int? resendToken) {
          verifyId = verificationId;
          update();
        },
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          log(e.toString(), name: 'Failed');
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      isVerifyLoading = false;
      update();
    } catch (e) {
      log(e.toString());
    }
    isVerifyLoading = false;
    update();
  }

  bool isOtpVerification = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> handlePhoneOtpVerification(context) async {
    isOtpVerification = true;
    update();
    String code = otpCtrl.text;
    log(verifyId, name: 'verification id');
    log(code, name: 'code');
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: code);
      await auth.signInWithCredential(credential).then((value) async =>
          await Get.off(() => const HomeView())!
              .then((value) => clearController()));
    } catch (e) {
      log(e.toString());
      return boatSnackBar(message: 'Invalid Otp', text: 'Failed', ctx: context);
    }
    isOtpVerification = false;
    update();
  }

  void clearController() {
    numberCtrl.clear();
    otpCtrl.clear();
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        if (user != null) {
          await Get.off(() => const HomeView());
        } else {
          boatSnackBar(text: 'Error', message: 'Something Wrong', ctx: context);
        }
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    } else {
      log("account is doesn't exist");
    }
  }

  handleScreens(context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Get.off(() => const HomeView(),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          transition: Transition.zoom);
    } else {
      return Get.off(() => const LoginView(),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          transition: Transition.zoom);
    }
  }

// logout
  Future<void> logout(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await auth.signOut();
      // final googleSignIn = GoogleSignIn();
      // await googleSignIn.signOut();
      await Get.offAll(() => const LoginView(),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          transition: Transition.zoom);
      boatSnackBar(
          message: 'Logout', text: 'Succeed', isSuccess: true, ctx: context);
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  ///*************************** singup with email and password *********************************
  bool isSignUpLoading = false;
  Future<User?> signUpWithEmailAndPassword(BuildContext ctx) async {
    isSignUpLoading = true;
    update();
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailCtrl.text, password: passworldCtrl.text);
      isSignUpLoading = false;
      update();
      passworldCtrl.clear();
      emailCtrl.clear();
      userNameCtrl.clear();
      boatSnackBar(
          message: 'SignUp SuccessFully',
          text: 'Succeed',
          isSuccess: true,
          ctx: ctx);
      return credential.user;
    } catch (e) {
      log(e.toString());
    }
    isSignUpLoading = false;
    update();
    return null;
  }

//*********************************************signin with email and password *******************************************
  bool isSignInLoading = false;
  Future<User?> signInWithEmailAndPasswords(BuildContext ctx) async {
    isSignInLoading = true;
    update();
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: emailCtrl.text, password: passworldCtrl.text);
      isSignInLoading = false;
      update();
      passworldCtrl.clear();
      emailCtrl.clear();
      boatSnackBar(
          message: 'Login SuccessFully',
          text: 'Succeed',
          isSuccess: true,
          ctx: ctx);
      return credential.user;
    } catch (e) {
      log(e.toString());
    }
    isSignInLoading = false;
    update();
    return null;
  }

  //*********************************************forgot password ***************************************

  bool isForgotLoading = false;
  Future<void> forgotPassword(context) async {
    isForgotLoading = true;
    update();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotEmailCtrl.text)
          .then((value) {
        Navigator.pop(context);
        forgotEmailCtrl.clear();
        isForgotLoading = false;
        boatSnackBar(
            message: 'Check Email Inbox',
            text: 'Succeed',
            isSuccess: true,
            ctx: context);
        update();
      });
    } catch (e) {
      log(e.toString());
    }
    isForgotLoading = false;
    update();
  }

  Future<void> facebookAuth() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await Get.off(() => const HomeView());
    } catch (e) {
      log(e.toString());
    }
  }
}
