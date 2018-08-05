import 'package:flutter/material.dart';

class FancyFloatingButton extends StatelessWidget {
  FancyFloatingButton({@required this.onPressed, this.rotation, this.showIcon});

  final onPressed;
  final rotation;
  final showIcon;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: rotation,
      child: RawMaterialButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showIcon
                  ? Icon(
                      Icons.explore,
                      color: Colors.purpleAccent,
                    )
                  : Text(''),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                'PURCHASE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        fillColor: Colors.deepPurple,
        splashColor: Colors.purple,
        onPressed: onPressed,
        shape: const StadiumBorder(),
      ),
    );
  }
}
