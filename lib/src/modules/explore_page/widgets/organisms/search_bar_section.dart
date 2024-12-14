import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constants.dart';

class SearchBarSection extends ConsumerWidget {
  const SearchBarSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
      ),
      child: SearchBar(
        hintText: 'Search',
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
