import 'package:flutter/material.dart';
import 'package:nectar/model/groceries_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';

class GroceriesWidget extends StatefulWidget {
  @override
  _GroceriesWidgetState createState() => _GroceriesWidgetState();
}

class _GroceriesWidgetState extends State<GroceriesWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  List<GroceriesModel> _groceries = [
    GroceriesModel(PNGs.imgPulses, 'Pulses', Color(0xFFF8A44C)),
    GroceriesModel(PNGs.imgSackOfRice, 'Rice', Color(0xFF53B175)),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Groceries',
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
        SizedBox(
          height: 105,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _groceries.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (0.5 / _groceries.length) * index,
                    1,
                    curve: Curves.easeOut,
                  ),
                ),
              );
              _animationController.forward();
              return _GroceriesItemWidget(
                _groceries[index],
                animationController: _animationController,
                animation: _animation,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

class _GroceriesItemWidget extends StatelessWidget {
  final GroceriesModel groceries;
  final AnimationController animationController;
  final Animation<double> animation;
  final GestureTapCallback onTap;

  const _GroceriesItemWidget(
    this.groceries, {
    this.animationController,
    this.animation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
              50 * (1.0 - animation.value),
              0.0,
              0.0,
            ),
            child: child,
          ),
        );
      },
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          color: groceries.bgColor.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        margin: const EdgeInsets.only(right: 16),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: onTap,
          splashColor: BaseColors.accentColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  groceries.groceriesImage,
                ),
                const SizedBox(width: 16),
                Text(
                  groceries.groceriesName,
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
