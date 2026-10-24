import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/status_badge.dart';

class ClaimDetailPage extends StatelessWidget {
  final String claimId;

  const ClaimDetailPage({super.key, required this.claimId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            size: 20,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/customer/claims');
            }
          },
        ),
        title: Text(
          'Claim #$claimId',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header Card
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#$claimId',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    StatusBadge.fromStatus('Approved'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Rear Bumper Collision & Dent Repair',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Policy: POL-88219 • Comprehensive Motor Protection',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CLAIMED AMOUNT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
                        SizedBox(height: 2),
                        Text('KES 165,000.00', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('APPROVED SETTLEMENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
                        SizedBox(height: 2),
                        Text('KES 165,000.00', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.success)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Progress Timeline Card
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Claim Progress Timeline',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTimelineStep(
                  title: 'Claim Submitted',
                  date: 'Oct 14, 2026 • 10:24 AM',
                  description: 'Initial claim and incident details lodged by customer.',
                  isDone: true,
                ),
                _buildTimelineStep(
                  title: 'Document & Police Report Verification',
                  date: 'Oct 15, 2026 • 02:15 PM',
                  description: 'All submitted photos and incident reports verified.',
                  isDone: true,
                ),
                _buildTimelineStep(
                  title: 'Damage Assessment',
                  date: 'Oct 18, 2026 • 11:30 AM',
                  description: 'Assessor inspection completed at authorized garage.',
                  isDone: true,
                ),
                _buildTimelineStep(
                  title: 'Claim Approved',
                  date: 'Oct 21, 2026 • 09:00 AM',
                  description: 'Approved by Senior Claims Officer (Amina Wanjiku).',
                  isDone: true,
                ),
                _buildTimelineStep(
                  title: 'Settlement Payout',
                  date: 'Estimated Oct 26, 2026',
                  description: 'Disbursement queued to your nominated bank account.',
                  isDone: false,
                  isLast: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Evidence Photos Card
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Uploaded Evidence (2 Files)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceSoft,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedFile01,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ),
                  title: const Text('bumper_damage_rear.jpg', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  subtitle: const Text('1.8 MB • Uploaded Oct 14', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  trailing: const StatusBadge(label: 'Verified'),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceSoft,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedFile01,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ),
                  title: const Text('police_abstract_report.pdf', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  subtitle: const Text('840 KB • Uploaded Oct 14', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  trailing: const StatusBadge(label: 'Verified'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required String title,
    required String date,
    required String description,
    required bool isDone,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isDone ? AppColors.primary : AppColors.surfaceSoft,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDone ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
              ),
              child: isDone
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 44,
                color: isDone ? AppColors.primary : AppColors.border,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isDone ? AppColors.textPrimary : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

