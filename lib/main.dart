import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'data/repositories/activity_repository.dart';
import 'data/services/local_activity_service.dart';
import 'ui/core/viewmodels/activity_viewmodel.dart';
import 'ui/shell/main_shell.dart';

void main() {
  final service = LocalActivityService();
  final repository = ActivityRepository(service);
  final viewModel = ActivityViewModel(repository);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final ActivityViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActivityCounter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: MainShell(viewModel: viewModel),
    );
  }
}
