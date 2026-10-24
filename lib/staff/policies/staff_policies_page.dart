import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class StaffPoliciesPage extends StatelessWidget {
  const StaffPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final policies = [
      {'code': 'POL-88219', 'holder': 'John Doe', 'type': 'Comprehensive Motor', 'limit': 'KES 3,500,000', 'status': 'Active'},
      {'code': 'POL-44012', 'holder': 'Sarah Jenkins', 'type': 'Homeowners All-Risk', 'limit': 'KES 12,000,000', 'status': 'Active'},
      {'code': 'POL-39921', 'holder': 'Otieno Logistics', 'type': 'Commercial Fleet', 'limit': 'KES 25,000,000', 'status': 'Active'},
      {'code': 'POL-10934', 'holder': 'Grace Muthoni', 'type': 'Family Health Shield', 'limit': 'KES 5,000,000', 'status': 'Active'},
    ];

    return AppScaffold(
      title: 'Policy Registry',
      currentRoute: '/staff/policies',
      isStaff: true,
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
                      p['code']!,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    StatusBadge.fromStatus(p['status']!),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  p['type']!,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 2),
                Text('Policy Holder: ${p['holder']}', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Underwritten by ClaimsDesk Syndicate', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                    Text('Limit: ${p['limit']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
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

