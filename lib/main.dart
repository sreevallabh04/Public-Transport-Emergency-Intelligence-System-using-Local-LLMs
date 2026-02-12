import 'package:flutter/material.dart';

/// ============================================================
/// Smart Bus Accident & Passenger Health Monitoring System
/// Passenger-side UI (Academic Demo) - UI ONLY / Dummy Data
///
/// - No backend, no BLE, no sensors, no business logic
/// - Seat-based identification: passengers are identified by seat location
/// ============================================================

void main() {
  runApp(const SmartBusPassengerApp());
}

class SmartBusPassengerApp extends StatelessWidget {
  const SmartBusPassengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Bus Passenger',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brandSeed),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      initialRoute: Routes.login,
      routes: {
        Routes.login: (_) => const PassengerLoginScreen(),
        Routes.setup: (_) => const PassengerSetupScreen(),
        Routes.dashboard: (_) => const DashboardScreen(),
        Routes.healthDetails: (_) => const PassengerHealthDetailsScreen(),
        Routes.emergency: (_) => const EmergencyAlertScreen(),
        Routes.adminLogin: (_) => const AdminLoginScreen(),
        Routes.adminOverview: (_) => const AdminBusOverviewScreen(),
      },
    );
  }
}

/// Simple route names to keep navigation readable.
class Routes {
  static const login = '/';
  static const setup = '/setup';
  static const dashboard = '/dashboard';
  static const healthDetails = '/health-details';
  static const emergency = '/emergency';
  static const adminLogin = '/admin-login';
  static const adminOverview = '/admin-overview';
}

/// ============================================================
/// Fake Login / Passenger Registration Screen
/// - Seat number
/// - Passenger ID
/// - Full name
/// - Existing health conditions
/// - Start destination
/// - End destination
///
/// NOTE: This is purely a UI/form demo. Entered values are not
///       persisted or used by the rest of the app (no backend).
/// ============================================================
class PassengerLoginScreen extends StatelessWidget {
  const PassengerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Smart Bus Passenger',
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Passenger Login / Seat Registration (Demo)',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Passenger Details',
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: DemoIdentity.seatNumber,
                                decoration: const InputDecoration(
                                  labelText: 'Seat Number',
                                  prefixIcon: Icon(Icons.event_seat),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: DemoIdentity.passengerId,
                                decoration: const InputDecoration(
                                  labelText: 'Passenger ID',
                                  prefixIcon: Icon(Icons.badge),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: 'Alex Kumar',
                                decoration: const InputDecoration(
                                  labelText: 'Full Name',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Health & Trip Information',
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: 'No known chronic conditions',
                                decoration: const InputDecoration(
                                  labelText: 'Existing Health Conditions',
                                  alignLabelWithHint: true,
                                  prefixIcon: Icon(Icons.health_and_safety),
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 3,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: 'City Center Bus Depot',
                                decoration: const InputDecoration(
                                  labelText: 'Start Destination',
                                  prefixIcon: Icon(Icons.place),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: 'Central Hospital',
                                decoration: const InputDecoration(
                                  labelText: 'End Destination',
                                  prefixIcon: Icon(Icons.local_hospital),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'This login screen is part of the academic UI demo only.\n'
                                'No data is stored, and no backend or sensors are involved.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      Routes.setup,
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Continue to Seat Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.adminLogin),
                    icon: const Icon(Icons.admin_panel_settings),
                    label: const Text('Admin Login (Demo)'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dummy identification values used throughout the UI for the academic demo.
class DemoIdentity {
  static const seatNumber = 'B12';
  static const passengerId = 'P-012';
}

/// ============================================================
/// Admin demo data: seat-wise passenger health snapshots (STATIC)
/// ============================================================
class DemoSeatStatus {
  const DemoSeatStatus({
    required this.seatNumber,
    required this.passengerId,
    required this.passengerName,
    required this.healthStatus,
    required this.heartRate,
    required this.stressLevel,
    required this.motionStatus,
    required this.existingCondition,
    required this.startDestination,
    required this.endDestination,
  });

  final String seatNumber;
  final String passengerId;
  final String passengerName;

  /// One of: Normal / Panic / Critical
  final String healthStatus;

  final String heartRate;
  final String stressLevel;
  final String motionStatus;

  final String existingCondition;
  final String startDestination;
  final String endDestination;

  Color get statusColor {
    switch (healthStatus) {
      case 'Critical':
        return AppColors.critical;
      case 'Panic':
        return AppColors.panic;
      default:
        return AppColors.normal;
    }
  }
}

const List<DemoSeatStatus> kDemoSeatStatuses = [
  DemoSeatStatus(
    seatNumber: 'A01',
    passengerId: 'P-001',
    passengerName: 'Riya',
    healthStatus: 'Normal',
    heartRate: '78 bpm',
    stressLevel: 'Low',
    motionStatus: 'Normal',
    existingCondition: 'None',
    startDestination: 'City Center',
    endDestination: 'University Gate',
  ),
  DemoSeatStatus(
    seatNumber: 'A02',
    passengerId: 'P-002',
    passengerName: 'Karthik',
    healthStatus: 'Panic',
    heartRate: '118 bpm',
    stressLevel: 'High',
    motionStatus: 'Restless',
    existingCondition: 'Asthma',
    startDestination: 'Bus Depot',
    endDestination: 'Tech Park',
  ),
  DemoSeatStatus(
    seatNumber: 'A03',
    passengerId: 'P-003',
    passengerName: 'Meera',
    healthStatus: 'Critical',
    heartRate: '132 bpm',
    stressLevel: 'Very High',
    motionStatus: 'Low movement',
    existingCondition: 'Heart condition',
    startDestination: 'Railway Station',
    endDestination: 'Central Hospital',
  ),
  DemoSeatStatus(
    seatNumber: 'B12',
    passengerId: 'P-012',
    passengerName: 'Alex Kumar',
    healthStatus: 'Normal',
    heartRate: '76 bpm',
    stressLevel: 'Low',
    motionStatus: 'Normal',
    existingCondition: 'No known chronic conditions',
    startDestination: 'City Center Bus Depot',
    endDestination: 'Central Hospital',
  ),
  DemoSeatStatus(
    seatNumber: 'C05',
    passengerId: 'P-020',
    passengerName: 'Sanjay',
    healthStatus: 'Normal',
    heartRate: '82 bpm',
    stressLevel: 'Moderate',
    motionStatus: 'Normal',
    existingCondition: 'Diabetes (Type 2)',
    startDestination: 'Market Road',
    endDestination: 'Community Clinic',
  ),
  DemoSeatStatus(
    seatNumber: 'D08',
    passengerId: 'P-031',
    passengerName: 'Asha',
    healthStatus: 'Panic',
    heartRate: '110 bpm',
    stressLevel: 'Elevated',
    motionStatus: 'Restless',
    existingCondition: 'Migraine',
    startDestination: 'Old Town',
    endDestination: 'City Center',
  ),
];

/// Color coding:
/// - Normal: green
/// - Panic: yellow/amber
/// - Critical: red
class AppColors {
  static const brandSeed = Color(0xFF1E88E5); // Blue seed for Material scheme.

  static const normal = Color(0xFF2E7D32); // Green 800
  static const panic = Color(0xFFF9A825); // Yellow 800
  static const critical = Color(0xFFC62828); // Red 800

  static const accident = Color(0xFFB71C1C); // Deep red for emergency banner.
}

/// ============================================================
/// Admin Login (MOCK) + Admin Bus Seat Overview (UI ONLY)
/// ============================================================
class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Login (Demo)'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Smart Bus Admin Console',
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Mock login for academic demo only.',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Admin ID',
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          Routes.adminOverview,
                        ),
                        icon: const Icon(Icons.directions_bus_filled),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'View Bus Seat Overview',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Back'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdminBusOverviewScreen extends StatelessWidget {
  const AdminBusOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Seat Overview'),
        actions: [
          IconButton(
            tooltip: 'Back to Passenger Login',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => false,
            ),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Seat-wise Passenger Health (Demo)',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Static values: heart rate, stress, motion, health condition, and trip route.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Make the grid responsive:
                    // - Small screens: 1 column, taller cards.
                    // - Larger screens/tablets: 2 columns.
                    final width = constraints.maxWidth;
                    final bool singleColumn = width < 520;
                    final crossAxisCount = singleColumn ? 1 : 2;
                    final childAspectRatio = singleColumn ? 1.1 : 0.8;

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemCount: kDemoSeatStatuses.length,
                      itemBuilder: (context, index) {
                        final seat = kDemoSeatStatuses[index];
                        return _AdminSeatCard(seat: seat);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdminSeatCard extends StatelessWidget {
  const _AdminSeatCard({required this.seat});

  final DemoSeatStatus seat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 34,
                  decoration: BoxDecoration(
                    color: seat.statusColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seat ${seat.seatNumber}',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        '${seat.passengerName} • ${seat.passengerId}',
                        style: theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                _HealthBadge(
                  label: seat.healthStatus,
                  color: seat.statusColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _AdminMetricChip(
                  icon: Icons.favorite_rounded,
                  label: seat.heartRate,
                ),
                _AdminMetricChip(
                  icon: Icons.psychology_alt_rounded,
                  label: seat.stressLevel,
                ),
                _AdminMetricChip(
                  icon: Icons.directions_walk_rounded,
                  label: seat.motionStatus,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Condition: ${seat.existingCondition}',
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              'Route: ${seat.startDestination} → ${seat.endDestination}',
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _HealthBadge extends StatelessWidget {
  const _HealthBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }
}

class _AdminMetricChip extends StatelessWidget {
  const _AdminMetricChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

/// Shared page scaffold used by multiple screens.
class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

/// A consistent ID banner shown at the top of each primary screen.
class SeatIdentityHeader extends StatelessWidget {
  const SeatIdentityHeader({
    super.key,
    required this.seatNumber,
    required this.passengerId,
    this.subtitle,
  });

  final String seatNumber;
  final String passengerId;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seat $seatNumber  •  Passenger $passengerId',
              style: theme.textTheme.titleLarge,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Text(subtitle!, style: theme.textTheme.bodyMedium),
            ],
          ],
        ),
      ),
    );
  }
}

/// A reusable status card that supports consistent color coding.
class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    this.icon,
    this.helperText,
  });

  final String title;
  final String value;
  final Color color;
  final IconData? icon;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 10,
              height: 72,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (icon != null) ...[
                        Icon(icon, color: color),
                        const SizedBox(width: 8),
                      ],
                      Text(title, style: theme.textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style:
                        theme.textTheme.headlineSmall?.copyWith(color: color),
                  ),
                  if (helperText != null) ...[
                    const SizedBox(height: 6),
                    Text(helperText!, style: theme.textTheme.bodyMedium),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// Screen 1: Passenger Setup / Seat Information (FIRST SCREEN)
/// ============================================================
class PassengerSetupScreen extends StatelessWidget {
  const PassengerSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Passenger Setup',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SeatIdentityHeader(
            seatNumber: DemoIdentity.seatNumber,
            passengerId: DemoIdentity.passengerId,
            subtitle:
                'Seat-based identification is used to track passengers during emergencies.',
          ),
          const SizedBox(height: 12),
          const Card(
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Demo Setup (Static)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This academic demo uses dummy values only.\n'
                    '- Seat Number: B12\n'
                    '- Passenger ID: P-012\n'
                    '\nNo sensors / BLE / backend are used in this UI build.',
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          FilledButton.icon(
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              Routes.dashboard,
            ),
            icon: const Icon(Icons.dashboard),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text(
                'Continue to Dashboard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ============================================================
/// Screen 2: Dashboard
/// - Seat number, passenger ID
/// - Health status (Normal/Panic/Critical) - color coded
/// - Bus status (Normal / Accident Detected)
/// ============================================================
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy (static) status values for demo purposes.
    const healthStatus = 'Normal';
    const healthColor = AppColors.normal;

    const busStatus = 'Normal';
    const busColor = AppColors.normal;

    return AppPageScaffold(
      title: 'Dashboard',
      actions: [
        IconButton(
          tooltip: 'Open Emergency Alert (Demo)',
          onPressed: () => Navigator.pushNamed(context, Routes.emergency),
          icon: const Icon(Icons.warning_rounded),
        ),
      ],
      child: ListView(
        children: const [
          SeatIdentityHeader(
            seatNumber: DemoIdentity.seatNumber,
            passengerId: DemoIdentity.passengerId,
            subtitle: 'Passenger-wise health summary & bus status.',
          ),
          SizedBox(height: 12),
          StatusCard(
            title: 'Health Status',
            value: healthStatus,
            color: healthColor,
            icon: Icons.favorite,
            helperText:
                'Normal = stable vitals.\nPanic = elevated stress.\nCritical = urgent attention required.',
          ),
          SizedBox(height: 12),
          StatusCard(
            title: 'Bus Status',
            value: busStatus,
            color: busColor,
            icon: Icons.directions_bus,
            helperText: 'Accident detection is represented as a UI-only demo.',
          ),
          SizedBox(height: 12),
          _DashboardActionsCard(),
        ],
      ),
    );
  }
}

class _DashboardActionsCard extends StatelessWidget {
  const _DashboardActionsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.healthDetails,
              ),
              icon: const Icon(Icons.monitor_heart),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'View Health Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.accident,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, Routes.emergency),
              icon: const Icon(Icons.sos),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Open Emergency Alert (Demo)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// Screen 3: Passenger Health Details
/// - Heart rate
/// - Stress level
/// - Motion status
/// ============================================================
class PassengerHealthDetailsScreen extends StatelessWidget {
  const PassengerHealthDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy (static) vitals for demo purposes.
    const heartRateBpm = 76;
    const stressLevel = 'Low';
    const motionStatus = 'Normal movement';

    return AppPageScaffold(
      title: 'Health Details',
      child: ListView(
        children: const [
          SeatIdentityHeader(
            seatNumber: DemoIdentity.seatNumber,
            passengerId: DemoIdentity.passengerId,
            subtitle: 'Detailed view (dummy values).',
          ),
          SizedBox(height: 12),
          _MetricCard(
            title: 'Heart Rate',
            value: '$heartRateBpm bpm',
            icon: Icons.favorite_rounded,
            accentColor: AppColors.normal,
            description: 'Example wearable reading shown for academic demo.',
          ),
          SizedBox(height: 12),
          _MetricCard(
            title: 'Stress Level',
            value: stressLevel,
            icon: Icons.psychology_alt_rounded,
            accentColor: AppColors.panic,
            description: 'Stress/panic indicators are color coded in the UI.',
          ),
          SizedBox(height: 12),
          _MetricCard(
            title: 'Motion Status',
            value: motionStatus,
            icon: Icons.directions_walk_rounded,
            accentColor: AppColors.normal,
            description: 'Motion can help detect immobility after an accident.',
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.accentColor,
    required this.description,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color accentColor;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: accentColor.withValues(alpha: 0.12),
              foregroundColor: accentColor,
              child: Icon(icon),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(color: accentColor),
                  ),
                  const SizedBox(height: 6),
                  Text(description, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// Screen 4: Emergency Alert
/// - Clear red warning UI
/// - Indicates accident detected and emergency alert sent
/// ============================================================
class EmergencyAlertScreen extends StatelessWidget {
  const EmergencyAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accident,
      appBar: AppBar(
        backgroundColor: AppColors.accident,
        foregroundColor: Colors.white,
        title: const Text('Emergency Alert'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Seat ${DemoIdentity.seatNumber}  •  Passenger ${DemoIdentity.passengerId}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'This is a UI-only demo screen (static).',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.warning_amber_rounded,
                          size: 72,
                          color: AppColors.accident,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'ACCIDENT DETECTED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: AppColors.accident,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'An emergency alert has been sent for this passenger.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 14),
                        Divider(),
                        SizedBox(height: 14),
                        Text(
                          'Emergency Response Note (Demo):\n'
                          'In the full system, passenger-wise health severity is shared to enable prioritized medical response.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.accident,
                ),
                onPressed: () => Navigator.popUntil(
                  context,
                  (route) =>
                      route.settings.name == Routes.dashboard || route.isFirst,
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Back to Dashboard',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
