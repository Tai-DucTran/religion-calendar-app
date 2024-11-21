import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeated_frequency_controller.g.dart';

@riverpod
class RepeatedFrequencyController extends _$RepeatedFrequencyController {
  @override
  RepeatedFrequency build() {
    return RepeatedFrequency.doesNotRepeat;
  }

  RepeatedFrequency get frequency => state;

  void setFrequency(RepeatedFrequency frequency) {
    state = frequency;
  }
}
