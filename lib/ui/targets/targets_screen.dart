import 'package:flutter/material.dart';

import '../../config/app_theme.dart';
import '../core/viewmodels/activity_viewmodel.dart';

class TargetsScreen extends StatelessWidget {
  final ActivityViewModel viewModel;

  const TargetsScreen({super.key, required this.viewModel});

  void _showAddDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final targetCtrl = TextEditingController(text: 'Target: 10 Kali');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardBackground,
        title: const Text(
          'Tambah Aktivitas Baru',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Nama Aktivitas',
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            TextField(
              controller: descCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            TextField(
              controller: targetCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Target',
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryPink,
            ),
            onPressed: () {
              if (titleCtrl.text.trim().isNotEmpty) {
                viewModel.addActivity(
                  titleCtrl.text.trim(),
                  'Kesehatan',
                  descCtrl.text.trim().isEmpty
                      ? 'Aktivitas harian'
                      : descCtrl.text.trim(),
                  targetCtrl.text.trim(),
                );
                Navigator.pop(ctx);
              }
            },
            child: const Text('Simpan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final incomplete = viewModel.incompleteActivities;
        final completed = viewModel.completedActivities;

        return Scaffold(
          backgroundColor: AppTheme.darkBackground,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppTheme.primaryPink,
            onPressed: () => _showAddDialog(context),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar Target',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Belum Selesai (${incomplete.length})',
                    style: const TextStyle(
                      color: AppTheme.primaryPink,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (incomplete.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Semua target aktivitas sudah selesai!',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ...incomplete.map(
                    (item) => _TargetTile(
                      title: item.title,
                      category: item.category,
                      description: item.description,
                      targetInfo:
                          '${item.targetInfo} • Hitungan: ${item.count}',
                      isCompleted: false,
                      onToggle: () => viewModel.toggleCompleted(item.id),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Selesai (${completed.length})',
                    style: const TextStyle(
                      color: Color(0xFF4CAF50),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...completed.map(
                    (item) => _TargetTile(
                      title: item.title,
                      category: item.category,
                      description: item.description,
                      targetInfo:
                          '${item.targetInfo} • Hitungan: ${item.count}',
                      isCompleted: true,
                      onToggle: () => viewModel.toggleCompleted(item.id),
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

class _TargetTile extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final String targetInfo;
  final bool isCompleted;
  final VoidCallback onToggle;

  const _TargetTile({
    required this.title,
    required this.category,
    required this.description,
    required this.targetInfo,
    required this.isCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isCompleted,
            activeColor: AppTheme.primaryPink,
            onChanged: (_) => onToggle(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  targetInfo,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
