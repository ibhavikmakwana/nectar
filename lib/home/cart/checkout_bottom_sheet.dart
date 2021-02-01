import 'package:flutter/material.dart';
import 'package:nectar/home/cart/congratulation_screen.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';

class CheckoutBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Checkout',
                      style: const TextStyle(
                        color: BaseColors.gray1,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SelectionItemWidget(
                    title: 'Delivery',
                    trailingWidget: Text(
                      'Select Method',
                      style: TextStyle(color: BaseColors.gray1),
                    ),
                  ),
                  SelectionItemWidget(
                    title: 'Payment',
                    trailingWidget: Text(
                      'GPay',
                      style: TextStyle(color: BaseColors.gray1),
                    ),
                  ),
                  SelectionItemWidget(
                    title: 'Promo Code',
                    trailingWidget: Text(
                      'Pick discount',
                      style: TextStyle(color: BaseColors.gray1),
                    ),
                  ),
                  SelectionItemWidget(
                    title: 'Total Cost',
                    trailingWidget: Text(
                      '\$13.97',
                      style: TextStyle(color: BaseColors.gray1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'By placing an order you agree to our ',
                        style: TextStyle(color: BaseColors.darkGray),
                        children: [
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(color: BaseColors.gray1),
                          ),
                          TextSpan(text: ' And '),
                          TextSpan(
                            text: 'Conditions',
                            style: TextStyle(color: BaseColors.gray1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: NectarButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => CongratulationScreen(),
                            fullscreenDialog: true,
                          ),
                          ModalRoute.withName('/home'),
                        );
                      },
                      text: 'Place Order',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        );
      },
      backgroundColor: BaseColors.grayishLimeGreen,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }
}

class SelectionItemWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final Widget trailingWidget;

  const SelectionItemWidget({
    Key key,
    this.title,
    this.onTap,
    this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
              color: BaseColors.darkGray,
              fontSize: 18,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingWidget != null) ...{
                trailingWidget,
                const SizedBox(width: 12),
              },
              Icon(
                Icons.navigate_next_rounded,
                size: 24,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
      ],
    );
  }
}
