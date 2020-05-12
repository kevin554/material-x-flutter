import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationPrimary extends StatefulWidget {

  static const route = '/bottom_navigation_primary';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationPrimary> {

  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {

    String _lastSelected = 'TAB: 0';

    void _selectedTab(int index) {
      setState(() {
        _lastSelected = 'TAB: $index';
      });
    }

    return Scaffold(
      bottomNavigationBar: FABBottomAppBar(
        items: [
          FABBottomAppBarItem(iconData: Icons.apps, text: 'Apps'),
          FABBottomAppBarItem(iconData: Icons.local_offer, text: 'Offer'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        backgroundColor: Colors.teal[600],
        child: Icon(Icons.shopping_cart),
        elevation: 2.0,
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

class FABBottomAppBarItem {

  IconData iconData;
  String text;

  FABBottomAppBarItem({this.iconData, this.text});

}

class FABBottomAppBar extends StatefulWidget {

  final List<FABBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;

  FABBottomAppBar({this.items, this.onTabSelected}) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {

  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabItem({FABBottomAppBarItem item, int index, ValueChanged<int> onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: Colors.teal[600],),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

}

