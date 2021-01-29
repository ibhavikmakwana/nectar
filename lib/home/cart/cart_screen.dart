import 'package:flutter/material.dart';
import 'package:nectar/model/product_model.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';
import 'package:nectar/widgets/custom_title.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  List<ProductModel> _cartItems = [
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
        CustomTitle(title: 'My Cart'),
        Expanded(
          child: ListView.separated(
            itemCount: _cartItems.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, index) {
              _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (0.5 / _cartItems.length) * index,
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
                child: CartListTile(_cartItems[index]),
              );
            },
            separatorBuilder: (_, index) {
              _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (0.5 / _cartItems.length) * index,
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
            text: 'Go to Checkout',
          ),
        ),
      ],
    );
  }
}

class CartListTile extends StatelessWidget {
  final ProductModel cartItem;
  CartListTile(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          cartItem.productImage,
          width: 92,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.productName,
                style: const TextStyle(
                  color: BaseColors.gray1,
                  fontSize: 16,
                ),
              ),
              Text(
                cartItem.quantity,
                style: const TextStyle(
                  color: BaseColors.darkGray,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              IncreaseDecreaseCounter(),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.close_rounded),
              visualDensity: VisualDensity.compact,
              onPressed: () {},
            ),
            Text(
              cartItem.amount,
              style: const TextStyle(
                color: BaseColors.gray1,
                fontSize: 18,
              ),
            )
          ],
        )
      ],
    );
  }
}

class IncreaseDecreaseCounter extends StatefulWidget {
  @override
  _IncreaseDecreaseCounterState createState() =>
      _IncreaseDecreaseCounterState();
}

class _IncreaseDecreaseCounterState extends State<IncreaseDecreaseCounter> {
  int initialCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: BaseColors.gray),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            onTap: () {
              if (initialCount > 1)
                setState(() {
                  initialCount--;
                });
            },
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Icon(
                Icons.remove,
                color: BaseColors.darkGray,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          '$initialCount',
          style: const TextStyle(
            color: BaseColors.gray1,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: BaseColors.gray),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            onTap: () {
              setState(() {
                initialCount++;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Icon(
                Icons.add,
                color: BaseColors.accentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
