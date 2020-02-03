import 'package:flutter/material.dart';
import 'package:learning_design/utils/constants.dart';

class RecentsList extends StatelessWidget {
  RecentsList({this.icon});
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Constants.users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(Constants.users[index].name[0]),
          ),
          trailing: icon != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(icon),
                  highlightColor: Colors.teal,
                )
              : Text(''),
          title: Text(Constants.users[index].name),
          subtitle: Text(Constants.users[index].phoneNo),
          onTap: () {},
        );
      },
    );
  }
}
