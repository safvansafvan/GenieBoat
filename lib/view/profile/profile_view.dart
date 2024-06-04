import 'package:chatboat/view/profile/view/mobile_view.dart';
import 'package:chatboat/view/profile/view/web_view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      return const MobileViewProfile();
    }
    if (context.isTablet) {
      return const WebViewProfile();
    }
    if (kIsWeb) {
      return const WebViewProfile();
    }

    return const SizedBox();
  }
}
