activate:
	dart pub global activate fvm && \
	dart pub global activate melos && \
	fvm flutter pub get && \
	melos bs && \
	melos generate:all

bs:
	melos clean && melos bs

gen:
	melos clean && melos bs && melos generate:all

icons:
	cd packages/aries && dart run lib/src/icon/generate_icons.dart

l10n:
	dart run scripts/generate_localized_keys.dart

upgrade: |
	flutter precache --ios && \
	cd ios && pod deintegrate && rm -f Podfile.lock && pod install --repo-update

rm_gen: |
	find . -name "*.gen.dart" -delete && \
	find . -name "*.freezed.dart" -delete && \
	find . -name "*.g.dart" -delete && \
	find . -name "custom_lint.log" -delete && \
	rm -f reports/localized_keys_report.csv

native_splash: |
	dart run flutter_native_splash:create --path=native_splash.yaml

l10n:
   dart run lib/l10n/generate_arb.dart
   dart run intl_translation:extract_to_arb --output-dir=lib/l10n lib/main.dart
   dart run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_files/intl_en.arb lib/l10n/intl_files/intl_vi.arb lib/l10n/localizations.dart

