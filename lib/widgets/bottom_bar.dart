import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/view/auth_view.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const Center(
      child: Text('Home Page'),
    ),
    const Center(
      child: Text('Cart Page'),
    ),
    const AuthScreen(),
    const Center(
      child: Text('Noti Page'),
    ),
    const Center(
      child: Text('Favorites Page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: updatePage,
        items: [
          //HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: bottomBarBorderWidth,
                    color: _page == 0
                        ? CustomColors.primaryColor
                        : CustomColors.scaffoldBackgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: 'Trang chính',
          ),
          //CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: bottomBarBorderWidth,
                    color: _page == 1
                        ? CustomColors.primaryColor
                        : CustomColors.scaffoldBackgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
            label: 'Giỏ hàng',
          ),
          //PROFILE
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: bottomBarBorderWidth,
                    color: _page == 2
                        ? CustomColors.primaryColor
                        : CustomColors.scaffoldBackgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline,
              ),
            ),
            label: 'Tài khoản',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: bottomBarBorderWidth,
                    color: _page == 3
                        ? CustomColors.primaryColor
                        : CustomColors.scaffoldBackgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.notifications_on_outlined,
              ),
            ),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: bottomBarBorderWidth,
                    color: _page == 4
                        ? CustomColors.primaryColor
                        : CustomColors.scaffoldBackgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.favorite_outline_outlined,
              ),
            ),
            label: 'Yêu thích',
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        iconSize: 25,
      ),
    );
  }
}
