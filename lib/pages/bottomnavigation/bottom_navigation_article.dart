import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationArticle extends StatefulWidget {

  static const route = '/bottom_navigation_article';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationArticle> {

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
          primaryColor: Colors.green[300],
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFFe6e6e6)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_module,
              ),
              title: Text('Module')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.data_usage,
              ),
                title: Text('Usage')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
              ),
                title: Text('Balance')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.folder,
              ),
                title: Text('Folder')
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                title: Text('Account')
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
