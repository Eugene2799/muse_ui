import 'package:flutter/material.dart';

class FlatButton extends StatefulWidget {
  const FlatButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.color,
      this.shape,
      this.padding});

  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;

  @override
  State<FlatButton> createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      overlayColor: Colors.transparent,
      foregroundColor: widget.color ?? Colors.black87,
      minimumSize: const Size(0, 36),
      padding: const EdgeInsets.all(0),
      shape: widget.shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
    );
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
