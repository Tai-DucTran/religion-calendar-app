import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

final displayedEventsProvider =
    StateNotifierProvider<DisplayedEventsNotifier, List<BasedEvent>>((ref) {
  return DisplayedEventsNotifier();
});

class DisplayedEventsNotifier extends StateNotifier<List<BasedEvent>> {
  DisplayedEventsNotifier() : super([]);
  int _currentPage = 0;
  bool _hasMore = true;

  int get currentPage => _currentPage;
  bool get hasMore => _hasMore;

  void addEvents(List<BasedEvent> newEvents, bool hasMoreEvents) {
    state = [...state, ...newEvents];
    _currentPage++;
    _hasMore = hasMoreEvents;
  }

  void reset() {
    state = [];
    _currentPage = 0;
    _hasMore = true;
  }
}

class AllEventsSection extends ConsumerStatefulWidget {
  const AllEventsSection({super.key});

  @override
  ConsumerState<AllEventsSection> createState() => _AllEventsSectionState();
}

class _AllEventsSectionState extends ConsumerState<AllEventsSection> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMoreEvents();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!mounted) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreEvents();
    }
  }

  Future<void> _loadMoreEvents() async {
    if (!mounted || _isLoading) return;

    setState(() => _isLoading = true);

    try {
      final allEvents = await ref.read(combineEventsControllerProvider.future);
      if (!mounted) return;

      final notifier = ref.read(displayedEventsProvider.notifier);
      final startIndex = notifier.currentPage * maxEventsHomePage;

      if (startIndex < allEvents.length) {
        final endIndex = (startIndex + maxEventsHomePage) > allEvents.length
            ? allEvents.length
            : startIndex + maxEventsHomePage;

        final newEvents = allEvents.sublist(startIndex, endIndex);
        final hasMore = endIndex < allEvents.length;
        notifier.addEvents(newEvents, hasMore);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildLoadMoreIndicator() {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: AriesColor.yellowP600,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 32.w,
      ),
      child: Text(
        LocalizedKeys.loadMoreEventsText,
        style: AriesTextStyles.textBodySmall.copyWith(
          color: AriesColor.yellowP950,
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return DefaultSkeleton(
      child: EventCard(
        eventName: mockLoadingTextContent,
        eventDate: DateTime.now(),
        eventTime: mockLoadingTextContent,
        eventCategory: EventCategory.businessEvent,
        eventLocation: mockLoadingTextContent,
        isLoading: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(combineEventsControllerProvider);
    final displayedEvents = ref.watch(displayedEventsProvider);
    final notifier = ref.watch(displayedEventsProvider.notifier);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      child: ListView(
        controller: _scrollController,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocalizedKeys.allEventsText,
                  style: AriesTextStyles.textHeading6,
                ),
              ),
              events.when(
                loading: () => _buildLoadingState(),
                error: (error, stackTrace) => const Offstage(),
                data: (listOfEvents) {
                  if (listOfEvents.isEmpty) {
                    return Text(LocalizedKeys.emptyEventText);
                  }

                  return Column(
                    children: [
                      ...displayedEvents.map(
                        (event) => GestureDetector(
                          onTap: () async {
                            if (!mounted) return;
                            final result = await ViewEventModalBottomSheet.show(
                              context,
                              event: event,
                            );
                            if (!result) return;
                          },
                          child: EventCard(
                            eventName: event.title,
                            eventDate: event.startDate,
                            eventTime: DateFormat(DateTimeFormat.hourMinute)
                                .format(event.startDate),
                            eventCategory: event.eventCategory,
                            eventLocation: event.location,
                          ),
                        ),
                      ),
                      if (notifier.hasMore)
                        Center(child: _buildLoadMoreIndicator()),
                      if (_isLoading && !notifier.hasMore) _buildLoadingState(),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
