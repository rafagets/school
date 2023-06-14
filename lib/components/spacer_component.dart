import 'package:flutter/material.dart';

class SpacerComponent extends StatelessWidget {
  final double? size;
  final bool isFull;
  final bool isHorizontalSpacer;

  const SpacerComponent({
    Key? key,
    this.size = 16,
    this.isFull = false,
    this.isHorizontalSpacer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFull
        ? const Spacer()
        : SizedBox(
            height: size, width: isHorizontalSpacer ? size : null, key: key);
  }
}
