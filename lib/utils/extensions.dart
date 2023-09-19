import 'package:flutter/material.dart';
import 'package:xwallet/utils/app_colors.dart';

extension ProperCase on String {
  String toProperCase() {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(' ');
    List<String> result = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        result.add(word[0].toUpperCase() + word.substring(1).toLowerCase());
      }
    }

    return result.join(' ');
  }
}

extension WidgetExtensions on Widget {
  // Add padding to a widget
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  // Add margin to a widget
  Widget margin(EdgeInsetsGeometry margin) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  // Center align a widget
  Widget center() {
    return Center(child: this);
  }

  // Align a widget to the top center
  Widget alignToTop() {
    return Align(
      alignment: Alignment.topCenter,
      child: this,
    );
  }

  // Align a widget to the bottom center
  Widget alignToBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: this,
    );
  }

  // Apply a BoxDecoration to a widget
  Widget withBoxDecoration(BoxDecoration decoration) {
    return DecoratedBox(
      decoration: decoration,
      child: this,
    );
  }

  // Add a background color to a widget
  Widget withBackgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  // Add a border to a widget
  Widget withBorder(Border border) {
    return DecoratedBox(
      decoration: BoxDecoration(border: border),
      child: this,
    );
  }

  // Apply a borderRadius to a widget
  Widget withBorderRadius(BorderRadius borderRadius) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: this,
    );
  }

  // Add a BoxDecoration with rounded corners
  Widget withRoundedCorners(
      {Color color = Colors.transparent, double radius = 8.0}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: this,
    );
  }

  // Add a gesture detector to a widget
  Widget withGestureDetector(GestureDetector gestureDetector) {
    return GestureDetector(
      onTap: gestureDetector.onTap,
      onLongPress: gestureDetector.onLongPress,
      child: this,
      // Add more gesture handlers as needed
    );
  }

  Widget showLoading(bool isLoading) {
    return Stack(
      children: [
        this,
        if (isLoading)
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black38,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          )
      ],
    );
  }
}
