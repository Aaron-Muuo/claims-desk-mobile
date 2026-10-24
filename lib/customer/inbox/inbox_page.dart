import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';

class CustomerInboxPage extends StatelessWidget {
  const CustomerInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'title': 'Claim #CLM-002 Approved by Adjuster',
        'snippet': 'Good news! Your claim for KES 165,000.00 has been approved. The settlement voucher is being processed.',
        'time': '2 hours ago',
        'isUnread': true,
      },
      {
        'title': 'Upcoming Policy Renewal Notice',
        'snippet': 'Your comprehensive motor policy POL-88219 is due for renewal on Nov 24, 2026. View renewal discounts.',
        'time': 'Yesterday',
        'isUnread': true,
      },
      {
        'title': 'Additional Information Received',
        'snippet': 'We have received the police report uploaded for claim #CLM-003. Assessment is now underway.',
        'time': '3 days ago',
        'isUnread': false,
      },
    ];

    return AppScaffold(
      title: 'Inbox',
      currentRoute: '/customer/inbox',
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        itemCount: messages.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final m = messages[index];
          final isUnread = m['isUnread'] as bool;
          return AppCard(
            backgroundColor: isUnread ? AppColors.surface : AppColors.surfaceSoft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isUnread ? AppColors.primaryLight : AppColors.surfaceSoft,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: isUnread ? AppColors.primary.withValues(alpha: 0.3) : AppColors.border),
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification01,
                    size: 16,
                    color: isUnread ? AppColors.primary : AppColors.textMuted,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              m['title'] as String,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          if (isUnread)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        m['snippet'] as String,
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        m['time'] as String,
                        style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

