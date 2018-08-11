import 'package:flutter/foundation.dart';
import 'package:learning_design/models/user.dart';

class Constants {
  //Routes
  static final String RootRoute = '/';
  static final String MySimpleDialog = '/MySimpleDialog';
  static final String MyFloatButton = '/MyFloatButton';
  static final String MyBottomNav = '/MyBottomNav';

  static double elevation() {
    return defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 3.0;
  }

  static List<User> users = <User>[
    User(name: 'Shah Zaman', phoneNo: '033312345678'),
    User(name: 'Zubair Ahmed', phoneNo: '033312345678'),
    User(name: 'Bilal Arshad', phoneNo: '033312345678'),
    User(name: 'Raja Qaiser', phoneNo: '033312345678'),
    User(name: 'Umair Shahid', phoneNo: '033312345678'),
    User(name: 'Arsalan Zaffar', phoneNo: '033312345678'),
    User(name: 'Salman Haider', phoneNo: '033312345678'),
    User(name: 'Awais Ahmed', phoneNo: '033312345678'),
    User(name: 'Imran Qaiser', phoneNo: '033312345678'),
    User(name: 'Ali Ahmed', phoneNo: '033312345678'),
  ];
}
