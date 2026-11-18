class ActivityModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String targetInfo;
  int count;
  bool isCompleted;

  ActivityModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.targetInfo,
    this.count = 0,
    this.isCompleted = false,
  });
}
