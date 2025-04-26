activate:
	dart pub global activate melos && \
	flutter pub get && \
	melos bs && \
	melos run generate

bs:
	melos clean && melos bs

gen:
	melos clean && melos bs && melos run generate

l10n: |
	flutter gen-l10n

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
	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*

clean: |
	flutter clean && \
	flutter pub get \

install_pre_git: 
	./scripts/install-hooks.sh