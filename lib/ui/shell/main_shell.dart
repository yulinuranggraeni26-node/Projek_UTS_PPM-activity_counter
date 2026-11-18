import 'package:flutter/material.dart';

import '../../config/app_theme.dart';
import '../core/viewmodels/activity_viewmodel.dart';
import '../counter/counter_screen.dart';
import '../home/home_screen.dart';
import '../notes/notes_screen.dart';
import '../targets/targets_screen.dart';

class MainShell extends StatefulWidget {
  final ActivityViewModel viewModel;

  const MainShell({super.key, required this.viewModel});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(viewModel: widget.viewModel),
      CounterScreen(viewModel: widget.viewModel),
      TargetsScreen(viewModel: widget.viewModel),
      NotesScreen(viewModel: widget.viewModel),
    ];

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final badgeCount = widget.viewModel.incompleteCount;
        return Scaffold(
          body: pages[_currentIndex],
          bottomNavigationBar: NavigationBar(
            backgroundColor: AppTheme.navBackground,
            indicatorColor: AppTheme.primaryPink.withValues(alpha: 0.25),
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() => _currentIndex = index);
            },
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.white70),
                selectedIcon: Icon(Icons.home, color: AppTheme.primaryPink),
                label: 'Home',
              ),
              const NavigationDestination(
                icon: Icon(Icons.calculate_outlined, color: Colors.white70),
                selectedIcon: Icon(
                  Icons.calculate,
                  color: AppTheme.primaryPink,
                ),
                label: 'Hitungan',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: badgeCount > 0,
                  label: Text('$badgeCount'),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white70,
                  ),
                ),
                selectedIcon: Badge(
                  isLabelVisible: badgeCount > 0,
                  label: Text('$badgeCount'),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppTheme.primaryPink,
                  ),
                ),
                label: 'Target',
              ),
              const NavigationDestination(
                icon: Icon(Icons.campaign_outlined, color: Colors.white70),
                selectedIcon: Icon(Icons.campaign, color: AppTheme.primaryPink),
                label: 'Catatan',
              ),
            ],
          ),
        );
      },
    );
  }
}
