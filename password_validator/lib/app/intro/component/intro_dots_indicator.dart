import 'package:flutter/material.dart';

class IntroDotsIndicator extends StatelessWidget {
  const IntroDotsIndicator({
    this.isActive = false,
    super.key,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 20 : 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primary : colorScheme.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
