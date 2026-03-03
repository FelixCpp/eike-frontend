import 'package:eike_frontend/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

enum ButtonVariant { secondary, outline, alert }

class Button extends StatelessWidget {
  const Button({
    required this.label,
    this.icon,
    this.variant = ButtonVariant.outline,
    this.disabled = false, // overrides even if onPressed is set
    this.fullWidth = false,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.borderColor,
    this.textStyle,
    super.key,
  });

  final String label;
  final IconData? icon;
  final ButtonVariant variant;
  final bool disabled;
  final bool fullWidth;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // Determine base colors via variant switch
    final (
      Color baseBg,
      Color baseIcon,
      Color baseText,
      Color baseBorder,
    ) = switch (variant) {
      ButtonVariant.secondary => (
        context.colors.secondaryContainer,
        context.colors.onSecondaryContainer,
        context.colors.onSecondaryContainer,
        context.colors.secondaryContainer,
      ),
      ButtonVariant.outline => (
        Colors.transparent,
        context.colors.onSecondaryContainer,
        context.colors.onSurfaceVariant,
        context.colors.outlineVariant,
      ),
      ButtonVariant.alert => (
        context.colors.errorContainer,
        context.colors.error,
        context.colors.onErrorContainer,
        context.colors.errorContainer,
      ),
    };

    // Override with custom colors if provided
    final Color bg = backgroundColor ?? baseBg;
    final Color ic = iconColor ?? baseIcon;
    Color fg = textColor ?? baseText;
    final Color br = borderColor ?? baseBorder;

    if (textStyle?.color != null) fg = textStyle!.color!;

    final bool isDisabled = disabled || onPressed == null;

    final TextStyle? labelStyle = (textStyle ?? context.textTheme.bodyMedium)
        ?.copyWith(
          fontWeight: textStyle?.fontWeight ?? FontWeight.w700,
          color: isDisabled ? fg.withValues(alpha: 0.6) : fg,
        );

    final button = FilledButton.icon(
      onPressed: isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        side: BorderSide(color: br.withValues(alpha: isDisabled ? 0.5 : 1)),
        backgroundColor: bg,
        foregroundColor: fg,
        disabledBackgroundColor: variant == ButtonVariant.outline
            ? bg
            : bg.withValues(alpha: 0.6),
        disabledForegroundColor: fg,
      ),
      icon: icon != null
          ? Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                icon,
                size: 24,
                color: isDisabled ? ic.withValues(alpha: 0.6) : ic,
              ),
            )
          : null,
      label: Text(label, style: labelStyle),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
