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

l10n: |
	flutter gen-l10n
	dart run lib/l10n/generate_localized_keys.dart

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

icon_launcher: |
	fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*

clean: |
	dart pub global activate fvm && \
	fvm flutter clean && \
	fvm flutter pub get \

install_pre_git: 
	./scripts/install-hooks.sh