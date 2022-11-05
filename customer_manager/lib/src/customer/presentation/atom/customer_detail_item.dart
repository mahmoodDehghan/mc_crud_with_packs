import 'package:flutter/material.dart';

class CustomerDetailItem extends StatelessWidget {
  const CustomerDetailItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final Icon icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: icon),
        Expanded(
          flex: 2,
          child: Text(label),
        ),
        Expanded(
          flex: 2,
          child: Text(value),
        ),
      ],
    );
  }
}
