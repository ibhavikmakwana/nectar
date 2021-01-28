import 'package:flutter/material.dart';
import 'package:nectar/model/product_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/product_grid_item.dart';

class BestSellingWidget extends StatelessWidget {
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
                  'Best Selling',
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
        BestSellingProductWidget(),
      ],
    );
  }
}

class BestSellingProductWidget extends StatefulWidget {
  @override
  _BestSellingProductWidgetState createState() =>
      _BestSellingProductWidgetState();
}

class _BestSellingProductWidgetState extends State<BestSellingProductWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  List<ProductModel> _products = [
    ProductModel(PNGs.imgBellPepperRed, 'Bell pepper red', '7pcs', '\$4.99'),
    ProductModel(PNGs.imgGinger, 'Ginger', '1kg', '\$4.99'),
    ProductModel(PNGs.imgEggPasta, 'Egg pasta', '30gm', '\$15.9'),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
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
