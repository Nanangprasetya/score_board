import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:score_board/core/config/environment.dart';
import 'package:score_board/core/helper/ad_halper.dart';

class AdsController extends GetxController {
  static AdsController to = Get.find();

  // You can also test with your own ad unit IDs by registering your device as a
  // test device. Check the logs for your device's ID value.
  String testDevice = 'YOUR_DEVICE_ID';
  int _numRewardedLoadAttempts = 0;
  int _maxFailedLoadAttempts = 3;
  RewardedAd _rewardedAd;

  final _hasAds = true.obs;
  final _isBannerAdReady = false.obs;
  final _isRewardedReady = false.obs;

  final _bannerAdWidget = BannerAd(
    adUnitId: '',
    listener: null,
    request: null,
    size: null,
  ).obs;

  bool get hasAds => _hasAds.value;
  bool get isBannerAdReady => _isBannerAdReady.value;
  bool get isRewardedReady => _isRewardedReady.value;
  BannerAd get bannerAdWidget => _bannerAdWidget.value;

  void setHasAds(bool value) => _setHasAds(value);
  void showRewardedAd() => _showRewardedAd();
  void createRewardedAd() => _createRewardedAd();
  void adsClick10X(int a, [int b]) => _adsClick10X(a, b);
  void adsClick2X(int a, [int b]) => _adsClick2X(a, b);

  void initBannerAd() => _initBannerAd();

  @override
  void onInit() {
    if(Environment.value.debug) {
      _hasAds.value = false;
    }
    super.onInit();
  }

  @override
  void onClose() {
    _rewardedAd.dispose();
    _bannerAdWidget.value.dispose();
    super.onClose();
  }

  void _setHasAds(bool value) {
    _hasAds.value = value;
    update();
  }

  void _createRewardedAd() {
    if (_hasAds.value) {
      RewardedAd.load(
        request: AdRequest(),
        adUnitId: AdHelper.rewardedAdUnitId,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('RewardedAd is Loaded : $ad');
            _rewardedAd = ad;
            _isRewardedReady.value = true;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd is Failed to load: $error');
            _rewardedAd = null;
            _isRewardedReady.value = false;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < _maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ),
      );
    }
    update();
  }

  void _showRewardedAd() {
    if (_hasAds.value) {
      if (_rewardedAd == null) {
        print('Warning: attempt to show rewarded before loaded.');
        return;
      }
      _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) =>
            print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createRewardedAd();
        },
      );

      _rewardedAd.setImmersiveMode(true);
      _rewardedAd.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
      });
      _rewardedAd = null;
    }
  }

  void _initBannerAd() {
    if (_hasAds.value) {
      final bannerAdWidget = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (_) {
            print('BannerAd Loaded : $_');
            _isBannerAdReady.value = true;
          },
          onAdFailedToLoad: (ad, err) {
            print('BannerAd is Failed to Load : ${err.message}');
            _isBannerAdReady.value = false;
            ad.dispose();
          },
        ),
      )..load();

      _bannerAdWidget.value = bannerAdWidget;
    }
    update();
  }

  void _adsClick10X(int a, [int b]) {
    final totalClick = a + b ?? 0;

    if (_isRewardedReady.value) {
      if (totalClick % 10 == 0) {
        print("10X Click Button then Show RewardedAd");
        AdsController.to.showRewardedAd();
      }
    }
  }

  void _adsClick2X(int a, [int b]) {
    final totalClick = a + (b ?? 0);

    if (_isRewardedReady.value) {
      if (totalClick % 2 == 0) {
        print("2X Click Button then Show RewardedAd");
        AdsController.to.showRewardedAd();
      }
    }
  }
}
