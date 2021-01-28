import 'package:flutter/material.dart';
import 'package:nectar/model/product_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/product_grid_item.dart';

class ExclusiveOffersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Exclusive Offer',
                  style: const TextStyle(
                    color: BaseColors.gray1,
                    fontSize: 24,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: const TextStyle(
                    color: BaseColors.accentColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        ExclusiveOffersProductWidget(),
      ],
    );
  }
}

class ExclusiveOffersProductWidget extends StatefulWidget {
  @override
  _ExclusiveOffersProductWidgetState createState() =>
      _ExclusiveOffersProductWidgetState();
}

class _ExclusiveOffersProductWidgetState
    extends State<ExclusiveOffersProductWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  List<ProductModel> _products = [
    ProductModel(PNGs.imgBanana, 'Organic Bananas', '7pcs', '\$4.99'),
    ProductModel(PNGs.imgApple, 'Red apple', '1kg', '\$4.99'),
    ProductModel(PNGs.imgEggChickenRed, 'Egg chicken red', '4pcs', '\$1.99'),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval(
                (0.5 / _products.length) * index,
                1,
                curve: Curves.easeOut,
              ),
            ),
          );
          _animationController.forward();
          return ProductGridItem(
            _products[index],
            animationController: _animationController,
            animation: _animation,
            onTap: () {},
          );
        },
      ),
    );
  }
}
