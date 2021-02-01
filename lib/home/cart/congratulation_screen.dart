import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/onboarding/signin/enter_number_screen.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';

class CongratulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredHeaderFooter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              SvgPicture.asset(SVGs.imgCongrats),
              const SizedBox(height: 16),
              Text(
                'Your Order has been accepted',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: BaseColors.gray1,
                  fontSize: 28,
                ),
              ),
              Text(
                'Your items has been placed and is on it’s way to being processed',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: BaseColors.darkGray,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              NectarButton(
                onPressed: () {},
                text: 'Track Order',
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Back to home',
                  style: const TextStyle(
                    color: BaseColors.gray1,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
