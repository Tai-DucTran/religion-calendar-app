import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

part 'admob_service_provider.g.dart';

@Riverpod(keepAlive: true)
class AdMobService extends _$AdMobService {
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @override
  AdMobService build() {
    return this;
  }

  Future<void> ensureInitialized() async {
    if (!_isInitialized) {
      await MobileAds.instance.initialize();
      _isInitialized = true;
    }
  }

  String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/2247696110' // Android test native ad
      : 'ca-app-pub-3940256099942544/3986624511'; // iOS test native ad

  NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: adUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) => Log.info('Native ad loaded'),
        onAdFailedToLoad: (ad, error) {
          Log.error('Native ad failed to load: $error');
          ad.dispose();
        },
        onAdOpened: (ad) => Log.info('Native ad opened'),
        onAdClosed: (ad) => Log.info('Native ad closed'),
      ),
    );
  }
}
