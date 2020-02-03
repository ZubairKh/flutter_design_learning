import 'package:flutter/material.dart';

String photoURL =
    "https://cdn.pixabay.com/photo/2015/06/19/21/24/the-road-815297__340.jpg";

class HeroWidgetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Widget'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              HeroWidgetDetail(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        )),
        child: Hero(
          tag: 'myImage',
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(photoURL),
          ),
        ),
      ),
    );
  }
}

class HeroWidgetDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Heor Detail Widget'),
        ),
        body: Container(
          color: Colors.amber,
          child: Center(
            child: Hero(
              tag: 'myImage',
              child: Image.network(photoURL),
            ),
          ),
        ));
  }
}
