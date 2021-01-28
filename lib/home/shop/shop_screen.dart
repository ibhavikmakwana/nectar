import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/home/shop/widgets/best_selling_widget.dart';
import 'package:nectar/home/shop/widgets/exclusive_offers_widget.dart';
import 'package:nectar/home/shop/widgets/groceries_widget.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/text_field/search_text_field.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _textEditingController;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            SvgPicture.asset(SVGs.icNectorColored, width: 26),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(SVGs.icLocationPin),
                const SizedBox(width: 4),
                Text(
                  'Ahmedabad, India',
                  style: const TextStyle(
                    fontSize: 18,
                    color: BaseColors.grayishCyan,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchTextField(
                controller: _textEditingController,
                hintText: 'Search Store',
                onChanged: (value) {},
                onSuffixPressed: () {
                  setState(() {
                    _textEditingController.text = '';
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(PNGs.icShopBanner),
            const SizedBox(height: 16),
            ExclusiveOffersWidget(),
            const SizedBox(height: 16),
            GroceriesWidget(),
            const SizedBox(height: 16),
            BestSellingWidget(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
