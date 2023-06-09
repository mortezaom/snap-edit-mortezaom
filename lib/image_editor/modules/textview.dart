import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  final double left;
  final double top;
  final void Function() ontap;
  final Function(DragUpdateDetails) onpanupdate;
  final Map mapJson;
  const TextView({
    super.key,
    required this.left,
    required this.top,
    required this.ontap,
    required this.onpanupdate,
    required this.mapJson,
  });
  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
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
