import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../splash/splash_screen.dart';
import '../auth/customer_login_page.dart';
import '../auth/staff_login_page.dart';

import '../customer/dashboard/dashboard.dart';
import '../customer/claims/claims_page.dart';
import '../customer/claims/new_claim_page.dart';
import '../customer/claims/claim_detail_page.dart';
import '../customer/memberships/memberships_page.dart';
import '../customer/policies/policies_page.dart';
import '../customer/inbox/inbox_page.dart';
import '../customer/profile/profile_page.dart';
import '../customer/settings/settings_page.dart';

import '../staff/dashboard/staff_dashboard.dart';
import '../staff/claims/staff_claims_page.dart';
import '../staff/approvals/approvals_page.dart';
import '../staff/members/members_page.dart';
import '../staff/policies/staff_policies_page.dart';
import '../staff/reports/reports_page.dart';
import '../staff/audit_trails/audit_trails_page.dart';
import '../staff/workflows/workflows_page.dart';
import '../staff/user_management/user_management_page.dart';
import '../staff/settings/staff_settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

CustomTransitionPage<void> _buildFadeInUpPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 260),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 0.05),
          end: Offset.zero,
        ).animate(curve),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curve),
          child: child,
        ),
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    // Splash
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const SplashScreen(),
      ),
    ),

    // Auth
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerLoginPage(),
      ),
    ),
    GoRoute(
      path: '/staff-login',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffLoginPage(),
      ),
    ),

    // Customer Portal
    GoRoute(
      path: '/customer/dashboard',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerDashboardPage(),
      ),
    ),
    GoRoute(
      path: '/customer/claims',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerClaimsPage(),
      ),
    ),
    GoRoute(
      path: '/customer/claims/new',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const NewClaimPage(),
      ),
    ),
    GoRoute(
      path: '/customer/claims/:id',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'] ?? 'CLM-002';
        return _buildFadeInUpPage(
          state: state,
          child: ClaimDetailPage(claimId: id),
        );
      },
    ),
    GoRoute(
      path: '/customer/memberships',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerMembershipsPage(),
      ),
    ),
    GoRoute(
      path: '/customer/policies',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerPoliciesPage(),
      ),
    ),
    GoRoute(
      path: '/customer/inbox',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerInboxPage(),
      ),
    ),
    GoRoute(
      path: '/customer/profile',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerProfilePage(),
      ),
    ),
    GoRoute(
      path: '/customer/settings',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const CustomerSettingsPage(),
      ),
    ),

    // Staff Portal
    GoRoute(
      path: '/staff/dashboard',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffDashboardPage(),
      ),
    ),
    GoRoute(
      path: '/staff/claims',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffClaimsPage(),
      ),
    ),
    GoRoute(
      path: '/staff/approvals',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffApprovalsPage(),
      ),
    ),
    GoRoute(
      path: '/staff/members',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffMembersPage(),
      ),
    ),
    GoRoute(
      path: '/staff/policies',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffPoliciesPage(),
      ),
    ),
    GoRoute(
      path: '/staff/reports',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffReportsPage(),
      ),
    ),
    GoRoute(
      path: '/staff/audit-trails',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffAuditTrailsPage(),
      ),
    ),
    GoRoute(
      path: '/staff/workflows',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffWorkflowsPage(),
      ),
    ),
    GoRoute(
      path: '/staff/user-management',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffUserManagementPage(),
      ),
    ),
    GoRoute(
      path: '/staff/settings',
      pageBuilder: (context, state) => _buildFadeInUpPage(
        state: state,
        child: const StaffSettingsPage(),
      ),
    ),
  ],
);
