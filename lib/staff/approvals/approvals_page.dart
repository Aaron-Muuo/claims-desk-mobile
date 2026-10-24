import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class StaffApprovalsPage extends StatelessWidget {
  const StaffApprovalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final approvals = [
      {
        'id': 'APV-9941',
        'claimId': 'CLM-1092',
        'claimant': 'John Doe',
        'type': 'Disbursement Authorization',
        'amount': 'KES 165,000.00',
        'reason': 'Final repair invoice verified with garage.',
      },
      {
        'id': 'APV-9942',
        'claimId': 'CLM-1088',
        'claimant': 'Karen Wangari',
        'type': 'Third-Party Liability Settlement',
        'amount': 'KES 420,000.00',
        'reason': 'Adjuster signed off on cross-indemnity deed.',
      },
      {
        'id': 'APV-9943',
        'claimId': 'CLM-1075',
        'claimant': 'Peter Maina',
        'type': 'Specialist Treatment Pre-Approval',
        'amount': 'KES 89,000.00',
        'reason': 'Medical panel recommendation attached.',
      },
    ];

    return AppScaffold(
      title: 'Approvals Queue',
      currentRoute: '/staff/approvals',
      isStaff: true,
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        itemCount: approvals.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = approvals[index];
          return AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#${item['id']} • ${item['claimId']}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    const StatusBadge(label: 'Pending Sign-Off'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item['type']!,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 2),
                Text('Claimant: ${item['claimant']}', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                Text(
                  item['reason']!,
                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      item['amount']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item['id']} rejected and returned to adjuster.')),
                        );
                      },
                      child: const Text('Reject', style: TextStyle(fontSize: 12, color: AppColors.danger)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item['id']} successfully signed off!'),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      },
                      child: const Text('Approve', style: TextStyle(fontSize: 12)),
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

