import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';

class StaffSettingsPage extends StatefulWidget {
  const StaffSettingsPage({super.key});

  @override
  State<StaffSettingsPage> createState() => _StaffSettingsPageState();
}

class _StaffSettingsPageState extends State<StaffSettingsPage> {
  bool _queueAlerts = true;
  bool _slaNotifications = true;
  bool _twoFactorAuth = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Staff Settings',
      currentRoute: '/staff/settings',
      isStaff: true,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Queue & Notification Preferences',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeTrackColor: AppColors.primary,
                  title: const Text('New Assigned Claim Alerts', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  subtitle: const Text('Notify immediately when a new claim is assigned to your queue', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  value: _queueAlerts,
                  onChanged: (val) => setState(() => _queueAlerts = val),
                ),
                const Divider(),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeTrackColor: AppColors.primary,
                  title: const Text('SLA Warning Alarms', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  subtitle: const Text('Alert when claims exceed 48 hours without adjuster review', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  value: _slaNotifications,
                  onChanged: (val) => setState(() => _slaNotifications = val),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enterprise Security',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeTrackColor: AppColors.primary,
                  title: const Text('Enforce Two-Factor Authentication', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  subtitle: const Text('Require biometric or authenticator OTP on each session', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  value: _twoFactorAuth,
                  onChanged: (val) => setState(() => _twoFactorAuth = val),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'System Environment',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                SizedBox(height: 12),
                Text('Environment: Production (Enterprise Cloud)', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                SizedBox(height: 4),
                Text('API Gateway: v2.4.0 • Region: af-south-1', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

