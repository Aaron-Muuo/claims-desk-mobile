import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class StaffMembersPage extends StatelessWidget {
  const StaffMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      {'name': 'John Doe', 'email': 'customer@example.com', 'tier': 'Gold Tier', 'policies': 3, 'claims': 2},
      {'name': 'Sarah Jenkins', 'email': 'sarah.j@outlook.com', 'tier': 'Platinum Tier', 'policies': 2, 'claims': 1},
      {'name': 'Michael Otieno', 'email': 'otieno.m@corp.ke', 'tier': 'Corporate Partner', 'policies': 12, 'claims': 4},
      {'name': 'Grace Muthoni', 'email': 'grace.m@gmail.com', 'tier': 'Silver Tier', 'policies': 1, 'claims': 1},
    ];

    return AppScaffold(
      title: 'Member Directory',
      currentRoute: '/staff/members',
      isStaff: true,
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: members.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final m = members[index];
          return AppCard(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primaryLight,
                  child: Text(
                    (m['name'] as String).substring(0, 1),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m['name'] as String,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        m['email'] as String,
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${m['policies']} Active Policies • ${m['claims']} Claims',
                        style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                StatusBadge(label: m['tier'] as String),
              ],
            ),
          );
        },
      ),
    );
  }
}

