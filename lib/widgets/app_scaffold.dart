import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../theme/app_theme.dart';
import 'app_drawer.dart';
import 'exit_confirmation.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final String currentRoute;
  final bool isStaff;
  final bool isRootPage;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.body,
    required this.title,
    required this.currentRoute,
    this.isStaff = false,
    this.isRootPage = false,
    this.floatingActionButton,
  });

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radius),
          side: const BorderSide(color: AppColors.border, width: 1.0),
        ),
        titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              size: 20.0,
              color: AppColors.primary,
            ),
            const SizedBox(width: 8),
            const Text(
              'Search Everything',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: isStaff ? 'Search claims, policies, members...' : 'Search claims or policies...',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      size: 16,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceSoft,
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Text(
                  'No recent searches. Try typing a claim number (e.g., CLM-002) or policy name.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNotificationsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.radius)),
        side: BorderSide(color: AppColors.border, width: 1.0),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '2 New',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.successBg,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.successBorder),
                  ),
                  child: const HugeIcon(
                    icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                    size: 16,
                    color: AppColors.success,
                  ),
                ),
                title: const Text(
                  'Claim Status Updated',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Your claim #CLM-002 has been marked as approved.',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
                trailing: const Text(
                  '2h ago',
                  style: TextStyle(fontSize: 10, color: AppColors.textMuted),
                ),
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.infoBg,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.infoBorder),
                  ),
                  child: const HugeIcon(
                    icon: HugeIcons.strokeRoundedFile01,
                    size: 16,
                    color: AppColors.info,
                  ),
                ),
                title: const Text(
                  'Policy Renewal Reminder',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Comprehensive Motor Policy expires in 30 days.',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
                trailing: const Text(
                  '1d ago',
                  style: TextStyle(fontSize: 10, color: AppColors.textMuted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    final scaffold = Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) {
            if (canPop && !isRootPage) {
              return IconButton(
                icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  size: 20.0,
                  color: AppColors.textPrimary,
                ),
                tooltip: 'Back',
                onPressed: () => Navigator.of(context).pop(),
              );
            }
            return IconButton(
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedMenu01,
                size: 20.0,
                color: AppColors.textPrimary,
              ),
              tooltip: 'Open navigation',
              onPressed: () => Scaffold.of(ctx).openDrawer(),
            );
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo-design-1.png',
              height: 24,
              width: 24,
              cacheWidth: 64,
              cacheHeight: 64,
              errorBuilder: (_, a, b) => const Icon(
                Icons.shield_outlined,
                size: 22,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              size: 20.0,
              color: AppColors.textPrimary,
            ),
            tooltip: 'Search',
            onPressed: () => _showSearchDialog(context),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedNotification01,
                  size: 20.0,
                  color: AppColors.textPrimary,
                ),
                tooltip: 'Notifications',
                onPressed: () => _showNotificationsSheet(context),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.danger,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),
      drawer: AppDrawer(
        isStaff: isStaff,
        currentRoute: currentRoute,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );

    if (isRootPage) {
      return RootExitScope(child: scaffold);
    }

    return scaffold;
  }
}
