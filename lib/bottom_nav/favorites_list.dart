import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_design/utils/constants.dart';

class FavoritesList extends StatelessWidget {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 0.5,
      mainAxisSpacing: 0.5,
      childAspectRatio: 1.1,
      children: List<Widget>.generate(
        Constants.users.length,
        (index) {
          return GridTile(
            footer: Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                Constants.users[index].name,
                style: Theme
                    .of(context)
                    .textTheme
                    .body2
                    .copyWith(color: Colors.white),
              ),
            ),
            child: Card(
              elevation: 0.0,
              color: Colors.primaries[next(0, 17)],
              child: InkWell(
                highlightColor: Colors.primaries[next(0, 17)],
                onTap: () {},
                child: Center(
                  child: Text(
                    Constants.users[index].name[0],
                    style: Theme
                        .of(context)
                        .textTheme
                        .display2
                        .copyWith(color: Colors.white70),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}
