import 'package:flutter/material.dart';
import 'package:learning_design/models/kitten.dart';
import 'package:learning_design/utils/constants.dart';

class MySimpleDialog extends StatelessWidget {
  final List<Kitten> _kittens = <Kitten>[
    Kitten(
      name: "Mittens",
      age: 11,
      description:
          "The pinnacle of cats. When Mittens sits on your lap, you feel like roylty",
      imageUrl:
          "https://www.pets4homes.co.uk/images/articles/4295/large/early-neutering-of-kittens-pros-and-cons-598ddb68021a9.jpg",
    ),
    Kitten(
      name: "Fluffy",
      age: 3,
      description: "World\'s cutest kitten. Seriously. we did the research.",
      imageUrl:
          "https://www.thehappycatsite.com/wp-content/uploads/2017/10/best-treats-for-kittens.jpg",
    ),
    Kitten(
      name: "Scooter",
      age: 9,
      description: "Chooses string faster than 9/10 competing kittens.",
      imageUrl:
          "https://d2kwjcq8j5htsz.cloudfront.net/2013/05/31105213/cute-photogenic-kitten.jpg",
    ),
    Kitten(
      name: "Steve",
      age: 4,
      description: "Steve is cool and just kind of hangs out.",
      imageUrl:
          "https://www.catster.com/wp-content/uploads/2017/12/A-gray-kitten-meowing.jpg",
    ),
  ];

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                kitten.name,
                style: localTheme.textTheme.display1,
              ),
              Text(
                '${kitten.age} months old',
                style: localTheme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                kitten.description,
                style: localTheme.textTheme.body1,
              ),
              SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('I\'M ALERGIC'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('ADOPT'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
            context: context,
            builder: (context) => _dialogBuilder(context, _kittens[index]),
          ),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                color: Colors.green,
                image: new DecorationImage(
                  image: new NetworkImage(_kittens[index].imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                border: new Border.all(
                  color: Colors.teal,
                  width: 4.0,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              _kittens[index].name,
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Dialog'),
        elevation: Constants.elevation(),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
