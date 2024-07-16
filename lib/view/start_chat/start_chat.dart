import 'package:chatboat/view/widgets/celebration.dart';
import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class StartChatingView extends StatelessWidget {
  const StartChatingView({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<DateTime> getTimeStream() {
      return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
    }

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.isPhone ? 0 : 12),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: !context.isPhone
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!context.isPhone) celebrationKit(),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 1000),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        curve: Curves.ease,
                        verticalOffset: 100.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        StreamBuilder(
                          stream: getTimeStream(),
                          builder: (context, snapshot) {
                            final now = snapshot.data;
                            final timeString =
                                '${now?.hour ?? '00'}:${now?.minute ?? 00}:${now?.second ?? 00}';
                            return Text(
                              timeString,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.7)),
                            );
                          },
                        ),
                        Text(
                          buildText(),
                          style: CustomFunctions.style(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.8),
                              fontWeight: FontWeight.w500,
                              size: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1000),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    curve: Curves.ease,
                    verticalOffset: 100.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Image.asset('assets/gif/boat-unscreen.gif',
                        height: 200, width: 200, fit: BoxFit.cover),
                    Text(
                      'How Can I Help You Today',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.bold,
                          size: 18,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: GenieMessageSender(),
            ),
          ],
        ),
      ),
    );
  }

  String buildText() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}
