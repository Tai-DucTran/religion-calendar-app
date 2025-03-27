import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/controllers/controllers.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ReaderTemplate extends ConsumerWidget {
  const ReaderTemplate({
    super.key,
    required this.documentPath,
  });

  final String documentPath;

  Future<String> _loadContent({
    required String locale,
    required String documentPath,
  }) async {
    final assetPath = '$documentPath$locale.md';
    return await rootBundle.loadString(assetPath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeControllerProvider).languageCode;

    return FutureBuilder<String>(
      future: _loadContent(
        locale: currentLocale,
        documentPath: documentPath,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ReaderSkeleton();
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.l10n.errorLoadingContentText),
                SizedBox(height: 8),
                Text(
                  snapshot.error.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          return MarkdownReader(
            content: snapshot.data!,
          );
        } else {
          return Center(
            child: Text(
              context.l10n.errorSomethingWentWrongText,
            ),
          );
        }
      },
    );
  }
}
