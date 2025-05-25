import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableButton extends StatelessWidget {
  const SlidableButton({
    super.key,
    this.color,
    required this.icon,
    required this.onClick,
    this.label,
    required this.bgColor,
  });

  final IconData icon;
  final Color bgColor;
  final Color? color;
  final SlidableActionCallback onClick;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onClick,
      backgroundColor: bgColor,
      foregroundColor: color,
      autoClose: true,
      label: label,
      icon: icon,
    );
  }
}
