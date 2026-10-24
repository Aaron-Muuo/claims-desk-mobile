import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class StaffWorkflowsPage extends StatelessWidget {
  const StaffWorkflowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workflows = [
      {
        'title': 'Auto-Triage Motor Claims Under KES 100,000',
        'desc': 'Automatically routes minor vehicle claims to authorized fast-track repairers without manual assessment.',
        'status': 'Active',
        'trigger': 'New Claim Submission (Amount < KES 100,000)',
      },
      {
        'title': 'High-Value Escalation Threshold',
        'desc': 'Triggers dual executive approval for any single claim exceeding KES 1,000,000 or total property loss.',
        'status': 'Active',
        'trigger': 'Claim Amount >= KES 1,000,000',
      },
      {
        'title': 'SLA Breach Warning Notification',
        'desc': 'Dispatches mobile push notification to supervisor when a claim remains unassigned for over 24 hours.',
        'status': 'Active',
        'trigger': 'Time in Queue > 24 Hours',
      },
    ];

    return AppScaffold(
      title: 'Automation Workflows',
      currentRoute: '/staff/workflows',
      isStaff: true,
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        itemCount: workflows.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final w = workflows[index];
          return AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        w['title']!,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                      ),
                    ),
                    StatusBadge.fromStatus(w['status']!),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  w['desc']!,
                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.4),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 6),
                Text(
                  'Trigger: ${w['trigger']}',
                  style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.textMuted),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

