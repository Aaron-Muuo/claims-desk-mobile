import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class CustomerPoliciesPage extends StatelessWidget {
  const CustomerPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final policies = [
      {
        'number': 'POL-88219',
        'title': 'Comprehensive Motor Vehicle',
        'vehicle': 'Toyota RAV4 (KDD 482B)',
        'coverage': 'KES 3,500,000 Limit',
        'expires': 'Nov 24, 2026',
        'status': 'Active',
      },
      {
        'number': 'POL-44012',
        'title': 'Homeowners & Contents Protection',
        'vehicle': 'Residence: Kilimani Court #4B',
        'coverage': 'KES 12,000,000 Limit',
        'expires': 'Feb 10, 2027',
        'status': 'Active',
      },
      {
        'number': 'POL-10934',
        'title': 'Family Health Shield Plus',
        'vehicle': '4 Covered Dependents',
        'coverage': 'KES 5,000,000 Annual Limit',
        'expires': 'Dec 31, 2026',
        'status': 'Active',
      },
    ];

    return AppScaffold(
      title: 'My Policies',
      currentRoute: '/customer/policies',
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        itemCount: policies.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final p = policies[index];
          return AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      p['number']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    StatusBadge.fromStatus(p['status']!),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  p['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  p['vehicle']!,
                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedShield01,
                          size: 14,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Expires: ${p['expires']}',
                          style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                        ),
                      ],
                    ),
                    Text(
                      p['coverage']!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

