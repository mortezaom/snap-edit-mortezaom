import 'package:flutter/material.dart';

class EmojiView extends StatefulWidget {
  final double left;
  final double top;
  final void Function() ontap;
  final Map mapJson;
  final Function(DragUpdateDetails) onpanupdate;

  const EmojiView({
    super.key,
    required this.left,
    required this.top,
    required this.ontap,
    required this.onpanupdate,
    required this.mapJson,
  });
  @override
  _EmojiViewState createState() => _EmojiViewState();
}

class _EmojiViewState extends State<EmojiView> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: GestureDetector(
        onTap: widget.ontap,
        onPanUpdate: widget.onpanupdate,
        child: Text(
          widget.mapJson['name'],
          textAlign: widget.mapJson['align'],
          style: TextStyle(
            color: widget.mapJson['color'],
            fontSize: widget.mapJson['size'],
          ),
        ),
      ),
    );
  }
}
