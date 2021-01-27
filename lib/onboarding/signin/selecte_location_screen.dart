import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nectar/onboarding/signin/enter_number_screen.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';

class SelectLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredHeaderFooter(
        child: SingleChildScrollView(
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
              Image.asset(PNGs.imgLocationIllustration),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select Your Location',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: BaseColors.gray1,
                    fontSize: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Switch on your location to stay in tune with what’s happening in your area',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: BaseColors.darkGray,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _ZoneAreaSelectorWidget(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NectarButton(
                  onPressed: () {},
                  text: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZoneAreaSelectorWidget extends StatefulWidget {
  @override
  _ZoneAreaSelectorWidgetState createState() => _ZoneAreaSelectorWidgetState();
}

class _ZoneAreaSelectorWidgetState extends State<_ZoneAreaSelectorWidget> {
  String zoneValue;
  String areaValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Text(
          'Your Zone',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: BaseColors.darkGray,
          ),
        ),
        DropdownButton<String>(
          value: zoneValue,
          hint: Text('Types of your zone'),
          isExpanded: true,
          itemHeight: 48,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 24,
          ),
          iconSize: 24,
          elevation: 16,
          underline: SizedBox.shrink(),
          onChanged: (String newValue) {
            setState(() {
              zoneValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Divider(),
        Text(
          'Your Area',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: BaseColors.darkGray,
          ),
        ),
        DropdownButton<String>(
          value: areaValue,
          hint: Text('Types of your area'),
          isExpanded: true,
          itemHeight: 48,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 24,
          ),
          iconSize: 24,
          elevation: 16,
          underline: SizedBox.shrink(),
          onChanged: (String newValue) {
            setState(() {
              areaValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Divider(),
      ],
    );
  }
}
