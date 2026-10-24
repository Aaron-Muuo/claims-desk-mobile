import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';

class StaffAuditTrailsPage extends StatelessWidget {
  const StaffAuditTrailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audits = [
      {
        'action': 'CLAIM_APPROVED',
        'details': 'Amina Wanjiku approved claim #CLM-1092 (KES 165,000.00)',
        'ip': '192.168.1.44 • Mobile App',
        'time': 'Today, 10:45 AM',
      },
      {
        'action': 'POLICY_AMENDED',
        'details': 'System updated endorsements on policy #POL-88219',
        'ip': 'Automated Trigger • Backend API',
        'time': 'Today, 09:12 AM',
      },
      {
        'action': 'DOCUMENT_UPLOADED',
        'details': 'Customer uploaded police_abstract_report.pdf to #CLM-1098',
        'ip': '197.232.14.8 • Customer App',
        'time': 'Yesterday, 04:30 PM',
      },
      {
        'action': 'AUTH_LOGIN_SUCCESS',
        'details': 'Staff user amina.wanjiku authenticated via 2FA SSO',
        'ip': '192.168.1.44 • Mobile App',
        'time': 'Yesterday, 08:00 AM',
      },
    ];

    return AppScaffold(
      title: 'Audit Trails',
      currentRoute: '/staff/audit-trails',
      isStaff: true,
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        itemCount: audits.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final a = audits[index];
          return AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceSoft,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        a['action']!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Text(a['time']!, style: const TextStyle(fontSize: 10, color: AppColors.textMuted)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  a['details']!,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  'Source: ${a['ip']}',
                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

