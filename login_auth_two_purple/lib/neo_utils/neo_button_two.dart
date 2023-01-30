import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class TappedNeoButton extends StatefulWidget {
  var myColor;
  var upIcon;

  TappedNeoButton({
    this.myColor,
    this.upIcon,
  });

  @override
  State<TappedNeoButton> createState() => _TappedNeoButtonState();
}

class _TappedNeoButtonState extends State<TappedNeoButton> {
  var isPressed = false;
  var myIcon = Icons.play_arrow;
  var myIcon2 = Icons.pause;
  var theIcon;

  void buttonPressed() {
    isPressed = !isPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        setState(() {
          isPressed = true;
        });
      },
      onPointerUp: (event) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        height: 30,
        width: 30,
        child: Center(child: widget.upIcon),
        decoration: BoxDecoration(
          color: widget.myColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              inset: isPressed,
              color: widget.myColor.shade200,
              offset: Offset(-2, -2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
            BoxShadow(
              inset: isPressed,
              color: widget.myColor.shade800,
              offset: Offset(2, 2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
