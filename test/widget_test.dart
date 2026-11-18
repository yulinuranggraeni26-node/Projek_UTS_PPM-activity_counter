import 'package:flutter_test/flutter_test.dart';
import 'package:activity_counter/data/repositories/activity_repository.dart';
import 'package:activity_counter/data/services/local_activity_service.dart';
import 'package:activity_counter/main.dart';
import 'package:activity_counter/ui/core/viewmodels/activity_viewmodel.dart';

void main() {
  testWidgets('ActivityCounter renders home screen correctly', (
    WidgetTester tester,
  ) async {
    final vm = ActivityViewModel(ActivityRepository(LocalActivityService()));
    await tester.pumpWidget(MyApp(viewModel: vm));

    expect(find.text('ActivityCounter'), findsOneWidget);
    expect(find.text('Semangat Beraktivitas!'), findsOneWidget);
  });
}
