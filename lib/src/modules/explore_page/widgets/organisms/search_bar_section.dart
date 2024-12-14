import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart';

class SearchBarSection extends ConsumerWidget {
  const SearchBarSection({
    super.key,
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userReligionPreferences =
        ref.watch(userControllerProvider).valueOrNull?.user?.religionPreference;
    final worshipReligionSearchHint =
        userReligionPreferences?.searchHintLocalized;
    final isWorshipSearch = tabIndex == 1;

    final selectedHintText = isWorshipSearch
        ? worshipReligionSearchHint
        : LocalizedKeys.libraryButtonText;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
      ),
      child: SearchBar(
        hintText: selectedHintText ?? LocalizedKeys.defaultSearchHintText,
        leading: const Icon(Icons.search),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: ScreenConfig.defaultHorizontalScreenPadding,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(AriesColor.neutral0),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        elevation: WidgetStateProperty.all(2),
        onChanged: (value) {},
        onSubmitted: (value) {},
      ),
    );
  }
}
