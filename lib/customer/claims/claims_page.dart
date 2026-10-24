import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/status_badge.dart';

class CustomerClaimsPage extends StatefulWidget {
  const CustomerClaimsPage({super.key});

  @override
  State<CustomerClaimsPage> createState() => _CustomerClaimsPageState();
}

class _CustomerClaimsPageState extends State<CustomerClaimsPage> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _claims = [
    {
      'id': 'CLM-002',
      'title': 'Rear Bumper Collision & Dent Repair',
      'policy': 'POL-88219 • Comprehensive Motor',
      'date': 'Oct 14, 2026',
      'amount': 'KES 165,000.00',
      'status': 'Approved',
    },
    {
      'id': 'CLM-003',
      'title': 'Water Damage to Kitchen Ceiling',
      'policy': 'POL-44012 • Home & Property',
      'date': 'Oct 20, 2026',
      'amount': 'KES 320,000.00',
      'status': 'Under Review',
    },
    {
      'id': 'CLM-001',
      'title': 'Windshield Stone Chip Crack',
      'policy': 'POL-88219 • Comprehensive Motor',
      'date': 'Aug 03, 2026',
      'amount': 'KES 42,000.00',
      'status': 'Settled',
    },
    {
      'id': 'CLM-000',
      'title': 'Routine Dental Specialist Procedure',
      'policy': 'POL-10934 • Health Plus Plan',
      'date': 'May 12, 2026',
      'amount': 'KES 68,000.00',
      'status': 'Settled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedFilter == 'All'
        ? _claims
        : _claims.where((c) => c['status'] == _selectedFilter).toList();

    return AppScaffold(
      title: 'My Claims',
      currentRoute: '/customer/claims',
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radius),
        ),
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedAdd01,
          size: 18,
          color: Colors.white,
        ),
        label: const Text('New Claim', style: TextStyle(fontWeight: FontWeight.w600)),
        onPressed: () => context.push('/customer/claims/new'),
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1.0),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Under Review', 'Approved', 'Settled'].map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(filter),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onSelected: (_) => setState(() => _selectedFilter = filter),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Claims List
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              separatorBuilder: (_, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final claim = filtered[index];
                return AppCard(
                  onTap: () => context.push('/customer/claims/${claim['id']}'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '#${claim['id']}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          StatusBadge.fromStatus(claim['status']),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        claim['title'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        claim['policy'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const HugeIcon(
                                icon: HugeIcons.strokeRoundedFile01,
                                size: 14,
                                color: AppColors.textMuted,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                claim['date'],
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            claim['amount'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
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

