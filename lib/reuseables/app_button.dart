import 'package:flutter/cupertino.dart';

// This widget converts its child to a button
class AppButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;
  final Color? colorWhenPressed;
  final FocusNode? focusNode;
  final Size? size;
  final bool isEnabled;
  const AppButton({
    super.key,
    required this.child,
    required this.onTap,
    this.colorWhenPressed,
    this.focusNode,
    this.color,
    this.size,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.4,
      child: SizedBox.fromSize(
        size: size,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            if (!isEnabled) return;
            if (onTap == null) return;
            onTap!();
          },
          color: color,
          borderRadius: BorderRadius.circular(8),
          child: child,
        ),
      ),
    );
  }
}
