import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/onboarding/signin/sign_in_screen.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            PNGs.imgOnboardBG,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'icNectorWhiteSplashToOnBoard',
                  child: SvgPicture.asset(SVGs.icNectorWhite),
                ),
                Text(
                  'Welcome to our store',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 48,
                    color: BaseColors.white,
                  ),
                ),
                Text(
                  'Ger your groceries in as fast as one hour',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: BaseColors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
                NectarButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => SignInScreen(),
                      ),
                    );
                  },
                  text: 'Get Started',
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
