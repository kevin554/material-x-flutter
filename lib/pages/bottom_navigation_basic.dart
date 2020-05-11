import 'package:flutter/material.dart';

class BottomNavigationBasic extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationBasic> {

  PageController _pageController;
  int _page = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
//          Chats(),
//          Friends(),
//          Home(),
//          Notifications(),
//          Profile(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Color(0xFF666666),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.white,
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
    _pageController = PageController(initialPage: 2);
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
