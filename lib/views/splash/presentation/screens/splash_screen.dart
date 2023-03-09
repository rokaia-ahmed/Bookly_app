import 'package:bookly_app/core/utiles/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utiles/app_router.dart';
import '../widgets/sliding_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       //crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
        Center(
          child: Image.asset(
            AppAssets.logo,
            width:150 ,
            height: 40,
            fit:BoxFit.fill ,
          ),
        ),
         const SizedBox(height: 10),
         AnimatedText(slidingAnimation: slidingAnimation),
       ],
     ),
    );
  }
  void initSlidingAnimation() {
    animationController=AnimationController(
        vsync: this, duration:const Duration(seconds: 1) );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0,5),end: Offset.zero).animate(animationController);
    animationController.forward()  ;
  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds:2 ),
          () {
          GoRouter.of(context).push(AppRouter.kHomeScreen);
      },
    );
  }
}

