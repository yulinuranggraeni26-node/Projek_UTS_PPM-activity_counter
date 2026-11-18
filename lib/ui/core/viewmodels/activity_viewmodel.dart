import 'package:flutter/material.dart';

import '../../../data/repositories/activity_repository.dart';
import '../../../domain/models/activity_model.dart';
import '../../../domain/models/note_model.dart';

class ActivityViewModel extends ChangeNotifier {
  final ActivityRepository _repository;
  late List<ActivityModel> _activities;
  late List<NoteModel> _notes;
  String _selectedCategory = 'Semua';

  ActivityViewModel(this._repository) {
    _activities = _repository.getActivities();
    _notes = _repository.getNotes();
  }

  List<ActivityModel> get allActivities => _activities;
  List<NoteModel> get notes => _notes;
  String get selectedCategory => _selectedCategory;

  List<ActivityModel> get filteredActivities {
    if (_selectedCategory == 'Semua') return _activities;
    return _activities.where((a) => a.category == _selectedCategory).toList();
  }

  List<ActivityModel> get incompleteActivities =>
      _activities.where((a) => !a.isCompleted).toList();

  List<ActivityModel> get completedActivities =>
      _activities.where((a) => a.isCompleted).toList();

  int get totalCount => _activities.fold(0, (sum, item) => sum + item.count);
  int get incompleteCount => incompleteActivities.length;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void incrementCount(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index].count++;
      notifyListeners();
    }
  }

  void decrementCount(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1 && _activities[index].count > 0) {
      _activities[index].count--;
      notifyListeners();
    }
  }

  void resetCount(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index].count = 0;
      notifyListeners();
    }
  }

  void toggleCompleted(String id) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index].isCompleted = !_activities[index].isCompleted;
      notifyListeners();
    }
  }

  void addActivity(
    String title,
    String category,
    String description,
    String targetInfo,
  ) {
    _activities.add(
      ActivityModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        category: category,
        description: description,
        targetInfo: targetInfo,
      ),
    );
    notifyListeners();
  }
}
