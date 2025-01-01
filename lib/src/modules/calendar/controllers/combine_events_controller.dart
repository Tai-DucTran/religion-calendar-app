import 'dart:ui';

import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/controllers/controllers.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

part 'combine_events_controller.g.dart';

@riverpod
class CombineEventsController extends _$CombineEventsController {
  @override
  FutureOr<List<BasedEvent>> build() async {
    ref.cache();
    return await getCombineEventsByMonth();
  }

  Future<List<BasedEvent>> getCombineEventsByMonth() async {
    final userEventsAsync = ref.watch(userEventControllerProvider);
    final religionEventsAsync = ref.watch(religionEventControllerProvider);
    final currentLocale = ref.watch(localeControllerProvider);

    final List<UserEvent> userEvents = await userEventsAsync.when(
      data: (data) => data,
      error: (_, __) => [],
      loading: () => [],
    );

    final convertedUserEventsToBasedEvents = userEvents.map(
      (event) => BasedEvent.fromUserEvent(event),
    );

    final List<ReligionEvent> religionEvents = await religionEventsAsync.when(
      data: (data) => data,
      error: (_, __) => [],
      loading: () => [],
    );
    final convertedReligionEventsToBasedEvents = religionEvents.map(
      (event) => BasedEvent.fromReligionEvent(
        event,
        currentLocale.languageCode,
      ),
    );

    final combinedEvents = [
      ...convertedUserEventsToBasedEvents,
      ...convertedReligionEventsToBasedEvents,
    ]..sort((a, b) => a.startDate.compareTo(b.startDate));

    return combinedEvents;
  }

  Map<DateTime, List<Color>> getMarkedDateWithColors() {
    return state.when(
      loading: () => {},
      error: (error, stackTrace) => {},
      data: (events) {
        if (events.isEmpty) {
          return {};
        }

        final markedDatesWithColors = getMarkedDatesFromEvents(events);
        return Map.fromEntries(
          markedDatesWithColors.map(
            (marked) => MapEntry(
              DateTime(
                marked.date.year,
                marked.date.month,
                marked.date.day,
              ),
              marked.markedColors,
            ),
          ),
        );
      },
    );
  }
}
