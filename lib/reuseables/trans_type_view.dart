import 'package:flutter/material.dart';

class TransTypeView extends StatelessWidget {
  const TransTypeView({super.key, required this.transType});
  final String transType;
  @override
  Widget build(BuildContext context) {
    if (transType == 'D') {
      return const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.arrow_outward_sharp,
          color: Colors.white,
        ),
      );
    }
    return Transform.flip(
      flipY: true,
      flipX: true,
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_outward_rounded, color: Colors.white),
      ),
    );
  }
}
