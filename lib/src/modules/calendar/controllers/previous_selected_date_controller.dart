import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'previous_selected_date_controller.g.dart';

@riverpod
class PreviousSelectedDateController extends _$PreviousSelectedDateController {
  @override
  DateTime build() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }


  void set(date) => state = date;
}