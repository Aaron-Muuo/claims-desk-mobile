import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final bool isStaff;
  final String currentRoute;

  const AppDrawer({
    super.key,
    required this.isStaff,
    required this.currentRoute,
  });

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radius),
          side: const BorderSide(color: AppColors.border, width: 1.0),
        ),
        title: const Text(
          'Sign out of portal?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        content: const Text(
          'Are you sure you want to sign out? You will need to log back in to access your claims desk.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.danger,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
              if (isStaff) {
                context.go('/staff-login');
              } else {
                context.go('/login');
              }
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: AppColors.textMuted,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required dynamic icon,
    required String label,
    required String route,
    String? badge,
  }) {
    final isActive = currentRoute == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Material(
        color: isActive ? AppColors.primaryLight : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: isActive ? AppColors.primary.withValues(alpha: 0.2) : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop(); // Close drawer
            if (currentRoute != route) {
              if (route == '/customer/dashboard' || route == '/staff/dashboard') {
                context.go(route);
              } else {
                context.push(route);
              }
            }
          },
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                HugeIcon(
                  icon: icon,
                  size: 18.0,
                  color: isActive ? AppColors.primary : AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: isActive ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.border, width: 1.0),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo-design-1.png',
                    height: 32,
                    width: 32,
                    errorBuilder: (_, a, b) => const Icon(
                      Icons.shield_outlined,
                      size: 28,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ClaimsDesk',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        isStaff ? 'Staff Portal' : 'Customer Portal',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Scrollable Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: isStaff ? _buildStaffItems(context) : _buildCustomerItems(context),
              ),
            ),

            // Bottom User Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.surfaceSoft,
                border: Border(
                  top: BorderSide(color: AppColors.border, width: 1.0),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      isStaff ? 'AW' : 'JD',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isStaff ? 'Amina Wanjiku' : 'John Doe',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          isStaff ? 'Claims Officer' : 'customer@example.com',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedLogout01,
                      size: 18.0,
                      color: AppColors.textSecondary,
                    ),
                    tooltip: 'Logout',
                    onPressed: () => _showLogoutDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCustomerItems(BuildContext context) {
    return [
      _buildSectionTitle('Overview'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedDashboardSquare01,
        label: 'Dashboard',
        route: '/customer/dashboard',
      ),

      _buildSectionTitle('Coverage'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedFile01,
        label: 'My Claims',
        route: '/customer/claims',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedShield01,
        label: 'My Memberships',
        route: '/customer/memberships',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedFile01,
        label: 'Policies',
        route: '/customer/policies',
      ),

      _buildSectionTitle('Account'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedNotification01,
        label: 'Inbox',
        badge: '2',
        route: '/customer/inbox',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedUser02,
        label: 'Profile',
        route: '/customer/profile',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedSettings01,
        label: 'Settings',
        route: '/customer/settings',
      ),
    ];
  }

  List<Widget> _buildStaffItems(BuildContext context) {
    return [
      _buildSectionTitle('Overview'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedDashboardSquare01,
        label: 'Dashboard',
        route: '/staff/dashboard',
      ),

      _buildSectionTitle('Workspace'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedFile01,
        label: 'Claims Queue',
        route: '/staff/claims',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedCheckmarkCircle02,
        label: 'Approvals',
        badge: '12',
        route: '/staff/approvals',
      ),

      _buildSectionTitle('Registry'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedUserMultiple,
        label: 'Members',
        route: '/staff/members',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedFile01,
        label: 'Policies',
        route: '/staff/policies',
      ),

      _buildSectionTitle('Governance'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedShield01,
        label: 'Audit Trails',
        route: '/staff/audit-trails',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedAnalytics01,
        label: 'Reports',
        route: '/staff/reports',
      ),

      _buildSectionTitle('Admin'),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedUser02,
        label: 'User Management',
        route: '/staff/user-management',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedGitBranch,
        label: 'Workflows',
        route: '/staff/workflows',
      ),
      _buildDrawerItem(
        context: context,
        icon: HugeIcons.strokeRoundedSettings01,
        label: 'Settings',
        route: '/staff/settings',
      ),
    ];
  }
}

