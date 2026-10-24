import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';

class StaffReportsPage extends StatelessWidget {
  const StaffReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Reports & Analytics',
      currentRoute: '/staff/reports',
      isStaff: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Monthly Claims Performance',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                const Text('October 2026 reporting cycle', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 16),
                _buildStatLine('Total Claims Lodged', '142 claims (+8% MoM)'),
                const Divider(),
                _buildStatLine('Claims Settled', '118 claims (KES 14,250,000 total)'),
                const Divider(),
                _buildStatLine('Average Turnaround Time', '2.8 business days'),
                const Divider(),
                _buildStatLine('Loss Ratio', '58.2% (Target < 65%)'),
                const Divider(),
                _buildStatLine('First-Time Resolution Rate', '84.6%'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Top Claim Categories by Volume',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 12),
                _buildCategoryBar('Motor Collision & Bodywork', 0.52, '52%'),
                const SizedBox(height: 10),
                _buildCategoryBar('Property & Water Ingress', 0.24, '24%'),
                const SizedBox(height: 10),
                _buildCategoryBar('Health & Outpatient Dental', 0.16, '16%'),
                const SizedBox(height: 10),
                _buildCategoryBar('Theft & Goods in Transit', 0.08, '8%'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildCategoryBar(String label, double ratio, String percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            Text(percent, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primary)),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: ratio,
            backgroundColor: AppColors.surfaceSoft,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}

