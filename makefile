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
	melos exec fvm flutter pub upgrade && \
	cd ios && pod deintegrate && rm -f Podfile.lock && pod install --repo-update

rm_gen: |
	find . -name "*.gen.dart" -delete && \
	find . -name "*.freezed.dart" -delete && \
	find . -name "*.g.dart" -delete && \
	find . -name "custom_lint.log" -delete && \
	rm -f reports/localized_keys_report.csv