import 'dart:developer';

import 'package:chatboat/view/auth/login.dart';
import 'package:chatboat/view/home/home.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController forgotEmailCtrl = TextEditingController();
  TextEditingController passworldCtrl = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
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
  TextEditingController phoneNumberCtrl = TextEditingController();
  String verifyId = '';
  bool isPhoneLoading = false;

  Future<void> handlePhoneAuth(context) async {
    isPhoneLoading = true;
    log(phoneNumberCtrl.text);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode + phoneNumberCtrl.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          log(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          verifyId = verificationId;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => PhoneOtpView(),
          //     ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
    isPhoneLoading = false;
    update();
  }

  //*************************** phoneotp authentication view  *********************************************************

  final TextEditingController otpController = TextEditingController();
  bool isPhoneVloading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> handlePhoneOtpVerification(context) async {
    isPhoneVloading = true;

    String code = otpController.text;
    log(verifyId);
    log(code);
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: code);
      await auth
          .signInWithCredential(credential)
          .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              )).then((value) => clearController()));
    } catch (e) {
      log(e.toString());
      return boatSnackBar(message: 'Invalid Otp', text: 'Failed');
    }
    isPhoneVloading = false;
    update();
  }

  void clearController() {
    phoneNumberCtrl.clear();
    otpController.clear();
    passworldCtrl.clear();
    emailCtrl.clear();
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
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
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    } else {
      log("account is doesn't exist");
    }

    return user;
  }

  handleScreens(context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const HomeView();
    } else {
      return const LoginView();
    }
  }

// logout
  Future<void> logout(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await auth.signOut();
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
        (route) => false,
      );
      boatSnackBar(message: 'Logout', text: 'Succeed', isSuccess: true);
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  ///*************************** singup with email and password *********************************
  bool isSignUpLoading = false;
  Future<User?> signUpWithEmailAndPassword() async {
    isSignUpLoading = true;
    update();
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailCtrl.text, password: passworldCtrl.text);
      isSignUpLoading = false;
      update();
      boatSnackBar(
          message: 'SignUp SuccessFully', text: 'Succeed', isSuccess: true);
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
  Future<User?> signInWithEmailAndPasswords() async {
    isSignInLoading = true;
    update();
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: emailCtrl.text, password: passworldCtrl.text);
      isSignInLoading = false;
      update();
      boatSnackBar(
          message: 'Login SuccessFully', text: 'Succeed', isSuccess: true);
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
          .sendPasswordResetEmail(email: forgotEmailCtrl.text.trim())
          .then((value) {
        Navigator.pop(context);
        forgotEmailCtrl.clear();
        isForgotLoading = false;
        boatSnackBar(
            message: 'Check Email Inbox', text: 'Succeed', isSuccess: true);
        update();
      });
    } catch (e) {
      log(e.toString());
    }
    isForgotLoading = false;
    update();
  }
}
