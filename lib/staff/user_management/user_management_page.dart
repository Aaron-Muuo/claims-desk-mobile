import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class StaffUserManagementPage extends StatelessWidget {
  const StaffUserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Amina Wanjiku', 'role': 'Senior Claims Adjuster', 'email': 'amina.w@claimsdesk.com', 'status': 'Active'},
      {'name': 'David Kimani', 'role': 'Claims Assessor', 'email': 'david.k@claimsdesk.com', 'status': 'Active'},
      {'name': 'Lydia Chebet', 'role': 'Approvals Supervisor', 'email': 'lydia.c@claimsdesk.com', 'status': 'Active'},
      {'name': 'Robert Ndegwa', 'role': 'IT & System Admin', 'email': 'robert.n@claimsdesk.com', 'status': 'Active'},
    ];

    return AppScaffold(
      title: 'User Management',
      currentRoute: '/staff/user-management',
      isStaff: true,
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: users.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final u = users[index];
          return AppCard(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    (u['name'] as String).substring(0, 1),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        u['name'] as String,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        u['role'] as String,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        u['email'] as String,
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                StatusBadge.fromStatus(u['status'] as String),
              ],
            ),
          );
        },
      ),
    );
  }
}

