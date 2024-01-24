import 'package:hfa/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/globals.dart';
import '../utils/size_config.dart';
import 'getting_started_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(
        () => const GettingStartedPage(),
      ),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeConfig = SizeConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Image.asset(
            ImageConstants.splashImage,
            fit: BoxFit.fill,
          ),
        ),
        // body: Stack(
        //   children: [
        //     SizedBox(
        //       width: double.infinity,
        //       child: Image.asset(
        //         ImageConstants,
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     Container(
        //       color: Colors.black.withOpacity(.3),
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         AspectRatio(
        //           aspectRatio: 1.5,
        //           child: Container(
        //             alignment: Alignment.center,
        //             child: Hero(
        //               tag: 'logo',
        //               child: Image.asset(
        //                 ImageConstants.logo,
        //               ),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           margin: EdgeInsets.only(
        //             bottom: sizeConfig.safeArea.bottom + sizeConfig.height(.04),
        //           ),
        //           alignment: Alignment.center,
        //           child: Image.asset(
        //             ImageConstants.headline,
        //             scale: 3,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      );
}
