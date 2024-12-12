import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_event_at_controller.g.dart';

@riverpod
class CreateEventAtController extends _$CreateEventAtController {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void set(DateTime date) => state = date;
}