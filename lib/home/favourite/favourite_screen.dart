import 'package:flutter/material.dart';
import 'package:nectar/model/product_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';
import 'package:nectar/widgets/custom_title.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  List<ProductModel> _favProducts = [
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
    return Column(
      children: [
        CustomTitle(title: 'Favourite'),
        Expanded(
          child: ListView.separated(
            itemCount: _favProducts.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, index) {
              _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (0.5 / _favProducts.length) * index,
                    1,
                    curve: Curves.easeOut,
                  ),
                ),
              );
              _animationController.forward(from: 0);
              return AnimatedBuilder(
                animation: _animationController,
                builder: (_, child) {
                  return FadeTransition(
                    opacity: _animation,
                    child: Transform(
                      transform: Matrix4.translationValues(
                        0.0,
                        50 * (1.0 - _animation.value),
                        0.0,
                      ),
                      child: child,
                    ),
                  );
                },
                child: ListTile(
                  onTap: () {},
                  leading: Image.asset(_favProducts[index].productImage),
                  title: Text(_favProducts[index].productName),
                  subtitle: Text(_favProducts[index].quantity),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_favProducts[index].amount),
                      Icon(
                        Icons.navigate_next_rounded,
                        size: 32,
                        color: BaseColors.gray1,
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) {
              _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (0.5 / _favProducts.length) * index,
                    1,
                    curve: Curves.easeOut,
                  ),
                ),
              );
              _animationController.forward(from: 0);
              return AnimatedBuilder(
                animation: _animationController,
                builder: (_, child) {
                  return FadeTransition(
                    opacity: _animation,
                    child: Transform(
                      transform: Matrix4.translationValues(
                        0.0,
                        50 * (1.0 - _animation.value),
                        0.0,
                      ),
                      child: child,
                    ),
                  );
                },
                child: Divider(),
              );
            },
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 78),
          child: NectarButton(
            onPressed: () {},
            text: 'Add All To Cart',
          ),
        ),
      ],
    );
  }
}
