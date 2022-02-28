import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:score_board/core/helper/ad_halper.dart';

class AdsController extends GetxController {
  static AdsController to = Get.find();
  int _numRewardedLoadAttempts = 0;
  int _maxFailedLoadAttempts = 3;

  RewardedAd _rewardedAd;

  final _isBannerAdReady = false.obs;
  final _bannerAdWidget = BannerAd(adUnitId: '', listener: null, request: null, size: null).obs;

  bool get isBannerAdReady => _isBannerAdReady.value;
  BannerAd get bannerAdWidget => _bannerAdWidget.value;

  void showRewardedAd() => _showRewardedAd();
  void createRewardedAd() => _createRewardedAd();

  void initBannerAd() => _initBannerAd();

  @override
  void onClose() {
    _rewardedAd.dispose();
    _bannerAdWidget.value.dispose();
    super.onClose();
  }

  void _createRewardedAd() {
    RewardedAd.load(
      request: AdRequest(),
      adUnitId: AdHelper.rewardedAdUnitId,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('RewardedAd is Loaded : $ad');
          _rewardedAd = ad;
          _numRewardedLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd is Failed to load: $error');
          _rewardedAd = null;
          _numRewardedLoadAttempts += 1;
          if (_numRewardedLoadAttempts < _maxFailedLoadAttempts) {
            _createRewardedAd();
          }
        },
      ),
    );
    update();
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
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
    _rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }

  void _initBannerAd() {
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
    update();
  }
}
