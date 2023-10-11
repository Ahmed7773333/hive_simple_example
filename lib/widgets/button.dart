import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;
  final Color? color;
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.data, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          minimumSize: Size(
            MediaQuery.of(context).size.width * (378 / 428),
            MediaQuery.of(context).size.height * (83 / 926),
          ),
        ),
        child: Center(
          child: Text(
            data,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
