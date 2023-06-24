import 'package:flutter/material.dart';

class StylishButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;
  const StylishButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  State<StylishButton> createState() => _StylishButtonState();
}

class _StylishButtonState extends State<StylishButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: widget.onPressed,
      splashColor: Colors.white.withOpacity(.5),
      splashFactory: InkRipple.splashFactory,
      child: Container(
        margin: const EdgeInsets.all(.5),
        decoration: BoxDecoration(
          color: const Color(0xFF21263A),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF000000),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 16),
              Text(
                widget.text,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
