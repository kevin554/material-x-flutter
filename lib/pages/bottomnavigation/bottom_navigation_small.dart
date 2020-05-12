import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationSmall extends StatefulWidget {

  static const route = '/bottom_navigation_small';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationSmall> {

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
          Fragment(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Color(0xFFFFFFFF),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.lightGreen[500],
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFFCCCCCC)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 16,
              ),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 16,
              ),
                title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                size: 16,
              ),
                title: Text('Box')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 16,
              ),
                title: Text('Favorite')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 16,
              ),
                title: Text('Person')
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
