import 'package:flutter/material.dart';

import '../../config/app_theme.dart';
import '../core/viewmodels/activity_viewmodel.dart';

class CounterScreen extends StatelessWidget {
  final ActivityViewModel viewModel;

  const CounterScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', 'Kesehatan', 'Olahraga', 'Belajar'];

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hitung Aktivitas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((cat) {
                        final selected = viewModel.selectedCategory == cat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(cat),
                            selected: selected,
                            onSelected: (_) => viewModel.selectCategory(cat),
                            selectedColor: AppTheme.primaryPink,
                            backgroundColor: AppTheme.cardBackground,
                            labelStyle: TextStyle(
                              color: selected ? Colors.white : Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Kategori: ${viewModel.selectedCategory}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.filteredActivities.length,
                      itemBuilder: (context, index) {
                        final item = viewModel.filteredActivities[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppTheme.primaryPink
                                    .withValues(alpha: 0.2),
                                child: const Icon(
                                  Icons.fitness_center,
                                  color: AppTheme.primaryPink,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.targetInfo,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      'Hitungan saat ini: ${item.count}',
                                      style: const TextStyle(
                                        color: AppTheme.primaryPink,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => viewModel.resetCount(item.id),
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white54,
                                ),
                                tooltip: 'Reset',
                              ),
                              IconButton(
                                onPressed: () =>
                                    viewModel.incrementCount(item.id),
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: AppTheme.primaryPink,
                                  size: 30,
                                ),
                                tooltip: 'Tambah',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
