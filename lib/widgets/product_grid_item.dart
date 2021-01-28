import 'package:flutter/material.dart';
import 'package:nectar/model/product_model.dart';
import 'package:nectar/values/base_colors.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;
  final AnimationController animationController;
  final Animation<double> animation;
  final GestureTapCallback onTap;
  const ProductGridItem(
    this.product, {
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
        width: 174,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: BaseColors.gray),
        ),
        margin: const EdgeInsets.only(right: 16),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: onTap,
          splashColor: BaseColors.accentColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    product.productImage,
                    height: 120,
                    width: 100,
                  ),
                ),
                Text(
                  product.productName,
                  style: const TextStyle(
                    color: BaseColors.gray1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  product.quantity,
                  style: const TextStyle(
                    color: BaseColors.darkGray,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.amount,
                        style: const TextStyle(
                          color: BaseColors.gray1,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    _AddButton()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Material(
        color: BaseColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              color: BaseColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
