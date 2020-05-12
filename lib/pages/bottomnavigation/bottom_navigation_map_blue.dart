import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/fragment.dart';


class BottomNavigationMapBlue extends StatefulWidget {

  static const route = '/bottom_navigation_map_blue';

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationMapBlue> {

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
          FABBottomAppBarItem(iconData: Icons.near_me, text: 'Map'),
          FABBottomAppBarItem(iconData: Icons.format_list_bulleted, text: 'List'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        backgroundColor: Color(0xFF1976D2),
        child: Icon(Icons.add),
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Icon(item.iconData, color: Color(0xFF1976D2)),
                ),
                Text(item.text,
                    style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
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

