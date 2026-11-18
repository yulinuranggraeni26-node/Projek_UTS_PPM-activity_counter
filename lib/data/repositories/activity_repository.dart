import '../../domain/models/activity_model.dart';
import '../../domain/models/note_model.dart';
import '../services/local_activity_service.dart';

class ActivityRepository {
  final LocalActivityService _service;

  ActivityRepository(this._service);

  List<ActivityModel> getActivities() => _service.getInitialActivities();
  List<NoteModel> getNotes() => _service.getInitialNotes();
}
