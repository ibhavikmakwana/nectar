import 'package:flutter/material.dart';
import 'package:nectar/home/explore/explore_selected_product_list.dart';
import 'package:nectar/model/find_product_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/custom_title.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  List<FindProductModel> _products = [
    FindProductModel(
        PNGs.imgFreshFruits, 'Fresh Fruits & Vegetable', Color(0xFF53B175)),
    FindProductModel(
        PNGs.imgCookingOilGhee, 'Cooking Oil & Ghee', Color(0xFFF8A44C)),
    FindProductModel(PNGs.imgMeatFish, 'Meat & Fish', Color(0xFFF7A593)),
    FindProductModel(
        PNGs.imgBakerySnacks, 'Bakery & Snacks', Color(0xFFD3B0E0)),
    FindProductModel(PNGs.imgDairyEggs, 'Dairy & Eggs', Color(0xFFFDE598)),
    FindProductModel(PNGs.imgBeverages, 'Beverages', Color(0xFFB7DFF5)),
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
        CustomTitle(title: 'Find Products'),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: _products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16) +
                EdgeInsets.only(
                  bottom: 78,
                ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
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
              _animationController.forward(from: 0);
              return ExploreItem(
                _products[index],
                animationController: _animationController,
                animation: _animation,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ExploreSelectedProductList(
                        title: _products[index].productName,
                      ),
                    ),
                  );
                },
                animationDirection: Axis.vertical,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ExploreItem extends StatelessWidget {
  final FindProductModel product;
  final AnimationController animationController;
  final Animation<double> animation;
  final GestureTapCallback onTap;
  final Axis animationDirection;

  const ExploreItem(
    this.product, {
    this.animationController,
    this.animation,
    this.onTap,
    this.animationDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: animationDirection == Axis.horizontal
                ? Matrix4.translationValues(
                    50 * (1.0 - animation.value),
                    0.0,
                    0.0,
                  )
                : Matrix4.translationValues(
                    0.0,
                    50 * (1.0 - animation.value),
                    0.0,
                  ),
            child: child,
          ),
        );
      },
      child: Container(
        width: 174,
        decoration: BoxDecoration(
          color: product.color.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: product.color.withOpacity(0.7)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  product.productImage,
                  height: 120,
                  width: 100,
                ),
                Text(
                  product.productName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: BaseColors.gray1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
