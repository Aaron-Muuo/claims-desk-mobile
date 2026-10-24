import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class StaffClaimsPage extends StatefulWidget {
  const StaffClaimsPage({super.key});

  @override
  State<StaffClaimsPage> createState() => _StaffClaimsPageState();
}

class _StaffClaimsPageState extends State<StaffClaimsPage> {
  String _selectedTab = 'All';

  final List<Map<String, dynamic>> _queue = [
    {
      'id': 'CLM-1092',
      'claimant': 'John Doe',
      'policy': 'POL-88219 (Motor)',
      'incident': 'Rear Bumper Collision',
      'amount': 'KES 165,000.00',
      'status': 'Approved',
      'adjuster': 'Amina W.',
    },
    {
      'id': 'CLM-1098',
      'claimant': 'Sarah Jenkins',
      'policy': 'POL-44012 (Property)',
      'incident': 'Storm Ceiling Water Damage',
      'amount': 'KES 340,000.00',
      'status': 'Under Review',
      'adjuster': 'David K.',
    },
    {
      'id': 'CLM-1102',
      'claimant': 'Michael Otieno',
      'policy': 'POL-39921 (Commercial)',
      'incident': 'Delivery Van Windshield Crack',
      'amount': 'KES 49,000.00',
      'status': 'Unassigned',
      'adjuster': 'Unassigned',
    },
    {
      'id': 'CLM-1105',
      'claimant': 'Grace Muthoni',
      'policy': 'POL-10934 (Health Plus)',
      'incident': 'Emergency Dental Consultation',
      'amount': 'KES 75,000.00',
      'status': 'Settled',
      'adjuster': 'Amina W.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedTab == 'All'
        ? _queue
        : _queue.where((c) => c['status'] == _selectedTab).toList();

    return AppScaffold(
      title: 'Claims Queue',
      currentRoute: '/staff/claims',
      isStaff: true,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              border: Border(bottom: BorderSide(color: AppColors.border, width: 1.0)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Unassigned', 'Under Review', 'Approved', 'Settled'].map((tab) {
                  final isSelected = _selectedTab == tab;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(tab),
                      selected: isSelected,
                      selectedColor: AppColors.primaryLight,
                      backgroundColor: AppColors.surfaceSoft,
                      side: BorderSide(
                        color: isSelected ? AppColors.primary : AppColors.border,
                        width: 1.0,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      onSelected: (_) => setState(() => _selectedTab = tab),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              separatorBuilder: (_, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final c = filtered[index];
                return AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '#${c['id']}',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '• ${c['claimant']}',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                              ),
                            ],
                          ),
                          StatusBadge.fromStatus(c['status']),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        c['incident'],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        c['policy'],
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Assignee: ${c['adjuster']}',
                            style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                          ),
                          Text(
                            c['amount'],
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

