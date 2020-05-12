import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationShop extends StatefulWidget {

  static const route = '/bottom_navigation_shop';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationShop> {

  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Fragment(),
          Fragment(),
          Fragment(),
          Fragment(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Color(0xFFFFFFFF),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Color(0xFF1976D2),
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFF999999)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
              ),
              title: Text('Brand'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('Account'),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

}
