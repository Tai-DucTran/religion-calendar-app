import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart';

class SearchBarSection extends ConsumerStatefulWidget {
  const SearchBarSection(this.tabIndex, {super.key});
  final int tabIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchBarSectionState();
}

class _SearchBarSectionState extends ConsumerState<SearchBarSection> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    print(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final userReligionPreferences =
        ref.watch(userControllerProvider).valueOrNull?.user?.religionPreference;
    final worshipReligionSearchHint =
        userReligionPreferences?.searchHintLocalized;
    final isWorshipSearch = widget.tabIndex == 1;

    final selectedHintText = isWorshipSearch
        ? worshipReligionSearchHint
        : LocalizedKeys.libraryButtonText;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
      ),
      child: SearchBar(
        controller: _searchController,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        elevation: WidgetStateProperty.all(2),
        onChanged: (value) {},
        onSubmitted: (value) {},
        hintText: selectedHintText ?? LocalizedKeys.defaultSearchHintText,
        leading: const Icon(
          Icons.search,
          color: AriesColor.yellowP950,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.0.r,
            ),
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: ScreenConfig.defaultHorizontalScreenPadding,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          AriesColor.neutral0,
        ),
      ),
    );
  }
}
