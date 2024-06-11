import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<String> verifyPhoneNumService(
      String countryCode, String number) async {
    String verifyId = '';
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countryCode + number,
      codeSent: (String verificationId, int? resendToken) {
        verifyId = verificationId;
      },
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        log(e.toString(), name: 'Failed');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return verifyId;
  }

  static Future<UserCredential> signUP(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> signIN(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> forgotPassword(String email) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<bool> deleteUserAccount() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();

      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == "requires-recent-login") {
        bool status = await reauthenticateAndDelete();
        if (status) {
          return true;
        }
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> reauthenticateAndDelete() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final providerData = auth.currentUser?.providerData.first;
      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await auth.currentUser!.reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await auth.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }
      await auth.currentUser?.delete();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
