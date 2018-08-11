import 'package:flutter/material.dart';
import 'package:learning_design/custom_widgets/fancy_floating_button.dart';
import 'package:learning_design/utils/constants.dart';

class MyFloatButton extends StatefulWidget {
  @override
  MyFloatButtonState createState() {
    return new MyFloatButtonState();
  }
}

class MyFloatButtonState extends State<MyFloatButton> {
  int _rotation = 0;
  bool _showIcon = false;
  String _showHideText = "SHOW ICON";
  bool _showOriginal = false;
  String _showHideOriginal = "SHOW ORIGINAL BUTTON";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Floating Button'),
        elevation: Constants.elevation(),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    _showOriginal = !_showOriginal;
                    _showHideOriginal = _showOriginal
                        ? "SHOW CUSTOM BUTTON"
                        : "SHOW ORIGINAL BUTTON";
                  });
                },
                child: Text(_showHideOriginal),
              ),
              FlatButton(
                onPressed: _showOriginal
                    ? null
                    : () {
                        setState(() {
                          _showIcon = !_showIcon;
                          _showHideText = _showIcon ? "HIDE ICON" : "SHOW ICON";
                        });
                      },
                child: Text(_showHideText),
              ),
              FlatButton(
                onPressed: _showOriginal
                    ? null
                    : () {
                        setState(() {
                          _rotation++;
                        });
                      },
                child: Text('ROTATE'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _showOriginal
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              tooltip: 'Original Floating Button',
              onPressed: () {
                print('On Tap of original button..');
              },
            )
          : FancyFloatingButton(
              onPressed: () {
                print('On Tap of custom button..');
              },
              rotation: _rotation,
              showIcon: _showIcon,
            ),
    );
  }
}
