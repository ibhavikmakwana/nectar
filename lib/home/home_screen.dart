import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/home/account/account_screen.dart';
import 'package:nectar/home/shop/shop_screen.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ShopScreen(),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.yellow,
          ),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          selectedItemColor: BaseColors.accentColor,
          unselectedItemColor: BaseColors.gray1,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (page) {
            setState(() {
              currentIndex = page;
              _pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(SVGs.icShop),
              label: 'Shop',
              activeIcon: SvgPicture.asset(
                SVGs.icShop,
                color: BaseColors.accentColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(SVGs.icExplore),
              label: 'Explore',
              activeIcon: SvgPicture.asset(
                SVGs.icExplore,
                color: BaseColors.accentColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(SVGs.icCart),
              label: 'Cart',
              activeIcon: SvgPicture.asset(
                SVGs.icCart,
                color: BaseColors.accentColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(SVGs.icFavourite),
              label: 'Favourite',
              activeIcon: SvgPicture.asset(
                SVGs.icFavourite,
                color: BaseColors.accentColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(SVGs.icAccount),
              label: 'Account',
              activeIcon: SvgPicture.asset(
                SVGs.icAccount,
                color: BaseColors.accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
