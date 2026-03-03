import 'package:eike_frontend/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {this.topPadding = 24, super.key});

  final String text;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: 18, left: 16),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
