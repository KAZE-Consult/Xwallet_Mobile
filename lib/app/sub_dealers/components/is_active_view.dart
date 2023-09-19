import 'package:flutter/material.dart';

class IsActiveView extends StatelessWidget {
  const IsActiveView({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Container(
        alignment: Alignment.center,
        width: 70,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green.withOpacity(0.1),
        ),
        child: const Text('Active', style: TextStyle(color: Colors.green)),
      );
    }
    return Container(
      alignment: Alignment.center,
      width: 90,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.red.withOpacity(0.1),
      ),
      child: const Text('Not-Active', style: TextStyle(color: Colors.red)),
    );
  }
}
