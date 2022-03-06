import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:score_board/core/controller/ads_controller.dart';
import 'package:score_board/core/controller/counter_controller.dart';
import 'package:score_board/core/controller/setting_controller.dart';
import 'package:score_board/core/controller/timer_controller.dart';
import 'package:score_board/utils/colors.dart';
import 'package:score_board/utils/images.dart';
import 'package:score_board/utils/size_config.dart';
import 'package:score_board/widget/label_triangle.dart';

class HomePage extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => (!controller.isEditScore) &&
                              (!controller.isWinLeft) &&
                              (!controller.isWinner)
                          ? controller.increment(CountType.LEFT)
                          : {},
                      child: Container(
                        color: SettingController.to.labelLeftBoardColor,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: SettingController.to.isLabelBoard,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  SettingController.to.textLeft,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            AutoSizeText(
                              controller.countLeft.toString(),
                              presetFontSizes: SettingController.to.lstDigitSize,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.text1,
                              ),
                            ),
                            Visibility(
                              visible: controller.isEditScore,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ToggleButtons(
                                  color: AppColors.black,
                                  fillColor: AppColors.white,
                                  selectedColor: AppColors.black,
                                  focusColor: AppColors.white,
                                  borderWidth: 0,
                                  constraints:
                                      BoxConstraints.tight(Size(50, 36)),
                                  borderRadius: BorderRadius.circular(20.0),
                                  isSelected: [true, true],
                                  onPressed: (index) {
                                    // Is Edit Score LEFT
                                    if (index == 0) {
                                      controller.decrement(CountType.LEFT);
                                    } else {
                                      controller.increment(CountType.LEFT);
                                    }
                                  },
                                  children: [
                                    Icon(Icons.remove_circle_outline, size: 20),
                                    Icon(Icons.add_circle_outline, size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => (!controller.isEditScore) &&
                              (!controller.isWinRight) &&
                              (!controller.isWinner)
                          ? controller.increment(CountType.RIGHT)
                          : {},
                      child: Container(
                        color: SettingController.to.labelRightBoardColor,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: SettingController.to.isLabelBoard,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  SettingController.to.textRight,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            AutoSizeText(
                              controller.countRight.toString(),
                              presetFontSizes: SettingController.to.lstDigitSize,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.text1,
                              ),
                            ),
                            Visibility(
                              visible: controller.isEditScore,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ToggleButtons(
                                  color: AppColors.black,
                                  fillColor: AppColors.white,
                                  selectedColor: AppColors.black,
                                  focusColor: AppColors.white,
                                  borderWidth: 0,
                                  constraints:
                                      BoxConstraints.tight(Size(50, 36)),
                                  borderRadius: BorderRadius.circular(20.0),
                                  isSelected: [true, true],
                                  onPressed: (index) {
                                    // Is Edit Score RIGHT
                                    if (index == 0) {
                                      controller.decrement(CountType.RIGHT);
                                    } else {
                                      controller.increment(CountType.RIGHT);
                                    }
                                  },
                                  children: [
                                    Icon(Icons.remove_circle_outline, size: 20),
                                    Icon(Icons.add_circle_outline, size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<AdsController>(
            builder: (adsController) {
              return Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: adsController.isBannerAdReady &&
                        CounterController.to.isEditScore
                    ? StatefulBuilder(
                        builder: (context, state) {
                          return SizedBox(
                            width: adsController.bannerAdWidget.size.width
                                .toDouble(),
                            height: adsController.bannerAdWidget.size.height
                                .toDouble(),
                            child: AdWidget(
                              ad: adsController.bannerAdWidget,
                            ),
                          );
                        },
                      )
                    : Container(),
              );
            },
          ),
          Obx(
            () => Positioned(
              top: 8,
              left: 8,
              child: Visibility(
                visible: controller.isEditScore,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.setIsEditScore(false);
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              top: 8,
              right: 8,
              left: 8,
              child: Visibility(
                visible: !controller.isEditScore,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !controller.isWinner
                        ? IconButton(
                            tooltip: "setting".tr,
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () => Get.toNamed('/settingPage'),
                          )
                        : SizedBox(height: 28),
                    Visibility(
                      visible: SettingController.to.isTimerBoard,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 10.0,
                        ),
                        child: Text(
                          TimerController.to.elapsedTime.toString(),
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ),
                    !controller.isWinner
                        ? IconButton(
                            tooltip: "edit.score".tr,
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controller.setIsEditScore(true);
                            },
                          )
                        : SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 8,
              right: 8,
              left: 8,
              child: Visibility(
                visible: !controller.isEditScore,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 52),
                    Visibility(
                      visible: SettingController.to.isTimerBoard,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextButton(
                              onPressed: () => TimerController.to.start(),
                              child: Text(
                                "start".tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Colors.white,
                              width: 0,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: TextButton(
                              onPressed: () => TimerController.to.stop(),
                              child: Text(
                                "stop".tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 52,
                      child: TextButton(
                        onPressed: () {
                          controller.reset();
                          TimerController.to.reset();
                          controller.setIsWinner(false);
                        },
                        child: Text(
                          "reset".tr,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Visibility(
                visible: controller.isWinner,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.widthMultiplier * 8,
                  color: AppColors.greenDark,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 48),
                        Text(
                          controller.messageWinner.tr,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 23,
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.setIsWinner(false),
                          icon: Icon(Icons.close),
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: LabelTriangle(
              color: AppColors.label,
              child: Image.asset(AppImages.label_ads),
              onTap: () => Get.toNamed("/purchasePage"),
            ),
          ),
        ],
      ),
    );
  }
}
