import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationShifting extends StatefulWidget {

  static const route = '/bottom_navigation_shifting';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationShifting> {

  PageController _pageController;
  int _page = 0;
  var canvasColor = Color(0xFF666666);

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
          canvasColor: canvasColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.white,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Color(0xFF999999)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
              ),
              title: Text('Movie & TV'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
              ),
              title: Text('Music'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              title: Text('Books'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chrome_reader_mode,
              ),
              title: Text('Newsstand'),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    switch(page) {
      case 0:
        canvasColor = Color(0xFF666666);
        break;

      case 1:
        canvasColor = Color(0xFFAD1457);
        break;

      case 2:
        canvasColor = Color(0xFF616161);
        break;

      case 3:
        canvasColor = Color(0xFF00695C);
        break;
    }

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
