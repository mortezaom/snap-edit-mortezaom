import 'package:flutter/material.dart';

class BottomBarContainer extends StatelessWidget {
  final Color colors;
  final void Function() ontap;
  final String title;
  final IconData icons;

  const BottomBarContainer(
      {super.key,
      required this.ontap,
      required this.title,
      required this.icons,
      required this.colors});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        child: InkWell(
          onTap: ontap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: Colors.white,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
