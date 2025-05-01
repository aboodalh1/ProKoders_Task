import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prokoders_login_task/core/util/navigate_function.dart';
import 'package:prokoders_login_task/core/util/styles.dart';
import 'package:prokoders_login_task/features/authentication/auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {
      navigateAndFinish(
        context,
        Directionality(textDirection: TextDirection.rtl, child: AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animation/ani1.json',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              Text(
                "Pro Kooders Shopping",
                style: AppStyles.interMedium20(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
