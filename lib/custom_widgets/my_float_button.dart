import 'package:flutter/material.dart';
import 'package:learning_design/custom_widgets/fancy_floating_button.dart';

class MyFloatButton extends StatefulWidget {
  int _rotation = 0;
  bool _showIcon = false;
  String _showHideText = "SHOW ICON";
  bool _showOriginal = false;
  String _showHideOriginal = "SHOW ORIGINAL BUTTON";

  @override
  MyFloatButtonState createState() {
    return new MyFloatButtonState();
  }
}

class MyFloatButtonState extends State<MyFloatButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Floating Button'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    widget._showOriginal = !widget._showOriginal;
                    widget._showHideOriginal = widget._showOriginal
                        ? "SHOW CUSTOM BUTTON"
                        : "SHOW ORIGINAL BUTTON";
                  });
                },
                child: Text(widget._showHideOriginal),
              ),
              FlatButton(
                onPressed: widget._showOriginal
                    ? null
                    : () {
                        setState(() {
                          widget._showIcon = !widget._showIcon;
                          widget._showHideText =
                              widget._showIcon ? "HIDE ICON" : "SHOW ICON";
                        });
                      },
                child: Text(widget._showHideText),
              ),
              FlatButton(
                onPressed: widget._showOriginal
                    ? null
                    : () {
                        setState(() {
                          widget._rotation++;
                        });
                      },
                child: Text('ROTATE'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: widget._showOriginal
          ? FloatingActionButton(
              child: Icon(
                Icons.explore,
                color: Colors.amber,
              ),
              backgroundColor: Colors.purple,
              tooltip: 'Original Floating Button',
              onPressed: () {
                print('On Tap of original button..');
              },
            )
          : FancyFloatingButton(
              onPressed: () {
                print('On Tap of custom button..');
              },
              rotation: widget._rotation,
              showIcon: widget._showIcon,
            ),
    );
  }
}
