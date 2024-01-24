import 'dart:io';
import 'package:fha/pages/registration_page.dart';
import 'package:fha/widgets/logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_constants.dart';
import '../../utils/globals.dart';
import 'login_page.dart';
import 'hfa_weblink_page.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            AspectRatio(
              aspectRatio: Platform.isIOS ? 1.5 : 1.8,
              child: const Hero(
                tag: 'logo',
                child: Logo(),
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) => const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                stops: [
                  0.0,
                  0.5,
                ],
              ).createShader(bounds),
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                ImageConstants.headline,
                scale: Platform.isIOS ? 3 : 4,
              ),
            ),
            SizedBox(
              height: sizeConfig.height(.03),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.01),
                horizontal: sizeConfig.width(.05),
              ),
              child: ElevatedButton(
                onPressed: _goToWebLinks(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey.shade300;
                      } else {
                        return Colors.white;
                      }
                    },
                  ),
                ),
                child: Text(
                  'GET STARTED',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.01),
                horizontal: sizeConfig.width(.05),
              ),
              child: ElevatedButton(
                onPressed: _goToLoginPage,
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary,
                  ),
                ),
                child: Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: sizeConfig.safeArea.bottom + sizeConfig.height(.02),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Don’t have an account?',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      ),
                  children: [
                    TextSpan(
                      text: ' Sign up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = _goToRegisterPage,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  /// Functions
  void _goToLoginPage() {
    Get.to(
      () => const LoginPage(),
    );
  }

  void _goToRegisterPage() {
    Get.to(
      () => const RegistrationPage(),
    );
  }

  void _goToWebLinks() {
    Get.to(
      () => const WebLinkPage(),
    );
  }
}
