import 'package:flutter/material.dart';
import 'package:learning_design/bottom_nav/favorites_list.dart';
import 'package:learning_design/bottom_nav/recents_list.dart';
import 'package:learning_design/utils/constants.dart';

List<String> _contents = <String>['Favorites', 'Recents', 'Contacts'];

class MyBottomNav extends StatefulWidget {
  @override
  MyBottomNavState createState() {
    return new MyBottomNavState();
  }
}

class MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      fixedColor: Colors.teal,
      onTap: _onTapItem,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text(_contents[0]),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text(_contents[1]),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          title: Text(_contents[2]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav Bar'),
        elevation: Constants.elevation(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.dialpad),
        tooltip: 'Dialer pad',
      ),
      body: BottomNavContents(
        index: _currentIndex,
      ),
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}

class BottomNavContents extends StatelessWidget {
  BottomNavContents({this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: navBarContents(index, context),
      ),
    );
  }

  Widget navBarContents(int index, BuildContext context) {
    switch (index) {
      case 0:
        return FavoritesList();
      case 1:
        return RecentsList(
          icon: Icons.call,
        );
      case 2:
        return RecentsList();
      default:
        return Container();
    }
  }
}
