import '../../domain/models/activity_model.dart';
import '../../domain/models/note_model.dart';

class LocalActivityService {
  List<ActivityModel> getInitialActivities() {
    return [
      ActivityModel(
        id: '1',
        title: 'Minum Air Putih',
        category: 'Kesehatan',
        description: 'Target 8 gelas per hari untuk menjaga hidrasi tubuh.',
        targetInfo: 'Target: 8 Gelas',
        count: 3,
        isCompleted: false,
      ),
      ActivityModel(
        id: '2',
        title: 'Push Up Pagi',
        category: 'Olahraga',
        description: 'Latihan kekuatan otot lengan dan dada.',
        targetInfo: 'Target: 20 Kali',
        count: 10,
        isCompleted: false,
      ),
      ActivityModel(
        id: '3',
        title: 'Baca Buku Pemrograman',
        category: 'Belajar',
        description: 'Membaca dokumentasi Flutter dan arsitektur berlapis.',
        targetInfo: 'Target: 30 Menit',
        count: 15,
        isCompleted: false,
      ),
      ActivityModel(
        id: '4',
        title: 'Latihan Soal Algoritma',
        category: 'Belajar',
        description: 'Menyelesaikan latihan struktur data harian.',
        targetInfo: 'Target: 5 Soal',
        count: 2,
        isCompleted: false,
      ),
    ];
  }

  List<NoteModel> getInitialNotes() {
    return [
      NoteModel(
        badge: 'Tips Harian',
        title: 'Konsistensi Lebih Penting',
        content: 'Lakukan aktivitas kecil secara rutin setiap hari untuk hasil maksimal.',
        date: '18 November 2026',
      ),
      NoteModel(
        badge: 'Target Minggu Ini',
        title: 'Evaluasi Aktivitas Fisik',
        content: 'Pastikan seluruh target olahraga dan hidrasi terpenuhi sebelum akhir pekan.',
        date: '17 November 2026',
      ),
      NoteModel(
        badge: 'Pengingat',
        title: 'Pengumpulan Tugas UTS',
        content: 'Aplikasi ActivityCounter menggunakan arsitektur berlapis siap didemokan.',
        date: '16 November 2026',
      ),
    ];
  }
}
