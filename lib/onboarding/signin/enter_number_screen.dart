import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nectar/onboarding/signin/enter_otp_screen.dart';
import 'package:nectar/utils/utils.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/navigate_next_fab.dart';
import 'package:nectar/widgets/country_picker/country_codes.dart';
import 'package:nectar/widgets/country_picker/country_model.dart';

class EnterNumberScreen extends StatelessWidget {
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
                'Enter your mobile number',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: BaseColors.gray1,
                  fontSize: 26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _EnterMobileNumberWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: NavigateNextFab(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => EnterOtpScreen(),
            ),
          );
        },
      ),
    );
  }
}

class _EnterMobileNumberWidget extends StatefulWidget {
  @override
  __EnterMobileNumberWidgetState createState() =>
      __EnterMobileNumberWidgetState();
}

class __EnterMobileNumberWidgetState extends State<_EnterMobileNumberWidget> {
  List<CountryModel> _countryList;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _countryList = countryCodes
        .map((country) => CountryModel.from(json: country))
        .toList();
    _selectedIndex =
        _countryList.indexWhere((element) => element.countryCode == 'IN');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Text(
          'Mobile Number',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: BaseColors.darkGray,
          ),
        ),
        Row(
          children: [
            Text(
              Utils.countryCodeToEmoji(
                _countryList[_selectedIndex ?? 0].countryCode,
              ),
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(width: 12),
            Text(
              '+${_countryList[_selectedIndex ?? 0].phoneCode} ',
              style: const TextStyle(
                color: BaseColors.gray1,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: TextField(
                style: const TextStyle(
                  color: BaseColors.gray1,
                  fontSize: 18,
                ),
                maxLength: 10,
                cursorColor: BaseColors.gray1,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class BlurredHeaderFooter extends StatelessWidget {
  final Widget child;
  const BlurredHeaderFooter({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Image.asset(PNGs.imgHeaderToBlur),
            const Spacer(),
            Image.asset(PNGs.imgFooterToBlur),
          ],
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            color: BaseColors.white.withOpacity(0.2),
            child: child,
          ),
        ),
      ],
    );
  }
}
