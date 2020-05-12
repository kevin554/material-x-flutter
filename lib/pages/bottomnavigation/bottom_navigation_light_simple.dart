import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationLightSimple extends StatefulWidget {

  static const route = '/bottom_navigation_light_simple';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationLightSimple> {

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
          primaryColor: Color(0xFF1E88E5),
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFFcccccc)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.web_asset,
              ),
              title: Text('Asset')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
              ),
                title: Text('Add')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
              ),
                title: Text('Mail')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
                title: Text('Profile')
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
