import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationIcon extends StatefulWidget {

  static const route = '/bottom_navigation_icon';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationIcon> {

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
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Color(0xFFFFFFFF),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.orange[500],
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFF666666)),
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
              ),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
                title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
              ),
                title: Text('Box')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
                title: Text('Favorite')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
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
