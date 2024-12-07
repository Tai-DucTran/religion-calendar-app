import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/controllers/controllers.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combine_events_controller.g.dart';

@riverpod
class CombineEventsController extends _$CombineEventsController {
  @override
  Future<List<BasedEvent>> build() async {
    ref.cache();
    final userEventsAsync = ref.watch(userEventControllerProvider);
    final religionEventsAsync = ref.watch(religionEventControllerProvider);
    final currentLocale = ref.watch(localeControllerProvider);

    // Wait for both AsyncValues to resolve
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

    final now = DateTime.now();

    final combinedEvents = [
      ...convertedUserEventsToBasedEvents.map((e) => e),
      ...convertedReligionEventsToBasedEvents.map((e) => e),
    ].where((event) => event.startDate.isAfter(now)).toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));

    return combinedEvents;
  }
}
