import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationDark extends StatefulWidget {

  static const route = '/bottom_navigation_dark';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationDark> {

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
          canvasColor: Color(0xFF212121),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Color(0xFFFFFFFF),
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFF666666)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              title: Text('Recents'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text('Favorites'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
              ),
              title: Text('Nearby'),
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
