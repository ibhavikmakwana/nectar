import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/onboarding/signin/enter_number_screen.dart';
import 'package:nectar/utils/utils.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';
import 'package:nectar/widgets/country_picker/country_codes.dart';
import 'package:nectar/widgets/country_picker/country_model.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(PNGs.imgSignInHeader),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Get your groceries with nectar',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: BaseColors.gray1,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EnterNumberScreen()),
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          Utils.countryCodeToEmoji(
                            _countryList[_selectedIndex ?? 0].countryCode,
                          ),
                          style: const TextStyle(fontSize: 25),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '+${_countryList[_selectedIndex ?? 0].phoneCode}',
                          style: const TextStyle(
                            color: BaseColors.gray1,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Or connect with social media',
              style: TextStyle(
                fontSize: 14,
                color: BaseColors.gray51,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NectarButton(
                onPressed: () {},
                text: 'Continue with Google',
                color: BaseColors.googleBlueButton,
                leadingWidget: SvgPicture.asset(SVGs.icGoogle),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NectarButton(
                onPressed: () {},
                text: 'Continue with Facebook',
                color: BaseColors.facebookBlueButton,
                leadingWidget: SvgPicture.asset(SVGs.icFacebook),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
