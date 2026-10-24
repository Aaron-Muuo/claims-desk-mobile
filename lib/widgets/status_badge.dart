import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  const StatusBadge({
    super.key,
    required this.label,
    this.color,
    this.backgroundColor,
    this.borderColor,
  });

  factory StatusBadge.fromStatus(String status) {
    final lower = status.toLowerCase();
    Color textCol;
    Color bgCol;
    Color borderCol;

    if (lower.contains('approved') || lower.contains('active') || lower.contains('settled') || lower.contains('completed')) {
      textCol = AppColors.success;
      bgCol = AppColors.successBg;
      borderCol = AppColors.successBorder;
    } else if (lower.contains('review') || lower.contains('pending') || lower.contains('waiting') || lower.contains('processing')) {
      textCol = AppColors.warning;
      bgCol = AppColors.warningBg;
      borderCol = AppColors.warningBorder;
    } else if (lower.contains('reject') || lower.contains('expired') || lower.contains('denied') || lower.contains('overdue')) {
      textCol = AppColors.danger;
      bgCol = AppColors.dangerBg;
      borderCol = AppColors.dangerBorder;
    } else {
      textCol = AppColors.info;
      bgCol = AppColors.infoBg;
      borderCol = AppColors.infoBorder;
    }

    return StatusBadge(
      label: status,
      color: textCol,
      backgroundColor: bgCol,
      borderColor: borderCol,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surfaceSoft,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: borderColor ?? AppColors.border,
          width: 1.0,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.textSecondary,
        ),
      ),
    );
  }
}

