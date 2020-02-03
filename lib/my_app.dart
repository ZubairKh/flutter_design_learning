import 'package:flutter/material.dart';
import 'package:learning_design/animated_widgets/hero_widget_page.dart';
import 'package:learning_design/bottom_nav/my_bottom_nav.dart';
import 'package:learning_design/custom_widgets/my_float_button.dart';
import 'package:learning_design/simple_dialog/simple_dialog.dart';
import 'package:learning_design/utils/constants.dart';

ThemeData kTheme = ThemeData(
  primarySwatch: Colors.teal,
  buttonColor: Colors.teal,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Designs',
      theme: kTheme,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Constants.RootRoute: (BuildContext context) => MyHomePage(),
        Constants.MySimpleDialog: (BuildContext context) => MySimpleDialog(),
        Constants.MyFloatButton: (BuildContext context) => MyFloatButton(),
        Constants.MyBottomNav: (BuildContext context) => MyBottomNav(),
        "/HeroWidget": (BuildContext context) => HeroWidgetMain()
      },
    );
  }
}

class ExampleList {
  const ExampleList({this.title, this.subTitle});

  final String title;
  final String subTitle;
}

final List<ExampleList> _examplesList = <ExampleList>[
  ExampleList(
    title: 'Simple Dialog',
    subTitle: 'A simple dialog using material design components...',
  ),
  ExampleList(
    title: 'Custom Floating Button',
    subTitle: 'A custom Floating button widget using material design...',
  ),
  ExampleList(
    title: 'Bottom Navigation',
    subTitle:
        'Bottom navigation bars allow movement between primary destinations in an app...',
  ),
  ExampleList(
    title: 'Hero Widget',
    subTitle: 'Learn how to create an animated widget like Hero!!',
  ),
  ExampleList(
    title: 'More Designs',
    subTitle: 'Coming soon :). You are welcome to contribute anytime...',
  ),
];

class MyHomePage extends StatelessWidget {
  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(Constants.MySimpleDialog);
        break;
      case 1:
        Navigator.of(context).pushNamed(Constants.MyFloatButton);
        break;
      case 2:
        Navigator.of(context).pushNamed(Constants.MyBottomNav);
        break;
      case 3:
        Navigator.of(context).pushNamed("/HeroWidget");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Flutter Design'),
        elevation: Constants.elevation(),
      ),
      body: ListView.builder(
        itemCount: _examplesList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: CircleAvatar(
              child: Text(_examplesList[index].title[0]),
            ),
            title: Text(_examplesList[index].title),
            subtitle: Text(_examplesList[index].subTitle),
            onTap: () => _navigateToPage(context, index),
          );
        },
      ),
    );
  }
}
