import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nectar/onboarding/signin/enter_number_screen.dart';
import 'package:nectar/onboarding/signin/selecte_location_screen.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/navigate_next_fab.dart';

class EnterOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredHeaderFooter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16) +
                  const EdgeInsets.only(top: 60),
              child: Text(
                'Enter your 4-digit code',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: BaseColors.gray1,
                  fontSize: 26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _EnterOTPWidget(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 32,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        fontSize: 18,
                        color: BaseColors.accentColor,
                      ),
                    ),
                  ),
                  NavigateNextFab(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => SelectLocationScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EnterOTPWidget extends StatefulWidget {
  @override
  _EnterOTPWidgetState createState() => _EnterOTPWidgetState();
}

class _EnterOTPWidgetState extends State<_EnterOTPWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Text(
          'Code',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: BaseColors.darkGray,
          ),
        ),
        TextField(
          style: const TextStyle(
            color: BaseColors.gray1,
            fontSize: 18,
            letterSpacing: 4,
          ),
          maxLength: 4,
          cursorColor: BaseColors.gray1,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            hintText: '- - - -',
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            hintStyle: const TextStyle(
              color: BaseColors.gray1,
              fontSize: 18,
              letterSpacing: 4,
            ),
            border: InputBorder.none,
          ),
        ),
        Divider(),
      ],
    );
  }
}
