import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onTapHandler;
  final IconData buttonIcon;
  const CustomIconButton({
    Key? key,
    required this.onTapHandler,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapHandler,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(13)),
        ),
        child: Icon(
          buttonIcon,
          size: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
