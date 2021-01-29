import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/home/explore/filter_screen.dart';
import 'package:nectar/model/product_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/product_grid_item.dart';

class ExploreSelectedProductList extends StatefulWidget {
  final String title;

  const ExploreSelectedProductList({Key key, this.title}) : super(key: key);

  @override
  _ExploreSelectedProductListState createState() =>
      _ExploreSelectedProductListState();
}

class _ExploreSelectedProductListState extends State<ExploreSelectedProductList>
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: BaseColors.gray1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: SvgPicture.asset(SVGs.icFilter),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FilterScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _products.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
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
          return ProductGridItem(
            _products[index],
            itemMargin: EdgeInsets.zero,
            animationDirection: Axis.vertical,
            animationController: _animationController,
            animation: _animation,
            onTap: () {},
          );
        },
      ),
    );
  }
}
