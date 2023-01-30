import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class PlayPauseNeoButton extends StatefulWidget {
  var myColor;
  var upIcon;
  var downIcon;

  PlayPauseNeoButton({
    this.myColor,
    this.upIcon,
    this.downIcon,
  });

  @override
  State<PlayPauseNeoButton> createState() => _PlayPauseNeoButtonState();
}

class _PlayPauseNeoButtonState extends State<PlayPauseNeoButton> {
  var isPressed = false;
  var myIcon = Icons.play_arrow;
  var myIcon2 = Icons.pause;
  var theIcon;

  void buttonPressed() {
    isPressed = !isPressed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          buttonPressed();
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        height: 70,
        width: 70,
        child: Icon(
          isPressed ? widget.downIcon : widget.upIcon,
          size: 50,
          color: Colors.grey.shade800,
        ),
        decoration: BoxDecoration(
          color: widget.myColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              inset: isPressed,
              color: widget.myColor.shade200,
              offset: Offset(-2, -2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
            BoxShadow(
              inset: isPressed,
              color: widget.myColor.shade800,
              offset: Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
