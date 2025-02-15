import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:religion_calendar_app/src/modules/admob/providers/admob_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'native_ad_controller.g.dart';

@riverpod
class NativeAdController extends _$NativeAdController {
  NativeAd? _nativeAd;

  @override
  Future<NativeAd?> build() async {
    ref.onDispose(() {
      _nativeAd?.dispose();
    });

    return _loadNativeAd();
  }

  Future<NativeAd?> _loadNativeAd() async {
    try {
      final adService = ref.read(adMobServiceProvider);
      await adService.ensureInitialized();

      final completer = Completer<NativeAd?>();

      _nativeAd = NativeAd(
        adUnitId: adService.adUnitId,
        factoryId: 'listTile',
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            completer.complete(ad as NativeAd);
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            completer.complete(null);
          },
          onAdOpened: (_) {},
          onAdClosed: (_) {},
        ),
      );

      await _nativeAd?.load();
      return completer.future;
    } catch (error) {
      return null;
    }
  }

  Future<void> reloadAd() async {
    state = const AsyncLoading();
    state = AsyncData(await _loadNativeAd());
  }
}
