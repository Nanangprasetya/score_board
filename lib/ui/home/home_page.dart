import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_board/core/controller/counter_controller.dart';
import 'package:score_board/core/controller/home_controller.dart';
import 'package:score_board/core/controller/setting_controller.dart';
import 'package:score_board/utils/colors.dart';
import 'package:score_board/utils/size_config.dart';

class HomePage extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: GetX<HomeController>(
        builder: (HomeController homeCountroller) => Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => !homeCountroller.isEditScore
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
                                    vertical: 4.0, horizontal: 16.0),
                                child: Text(
                                  SettingController.to.labelLeftField.text,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.isWinLeft ? "WIN" : controller.countLeft.toString(),
                              style: TextStyle(
                                fontSize: controller.isWinLeft ? 140 :180,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Visibility(
                              visible: homeCountroller.isEditScore,
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
                      onTap: () => !homeCountroller.isEditScore
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
                                    vertical: 4.0, horizontal: 16.0),
                                child: Text(
                                  SettingController.to.labelRightField.text,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.isWinRight ? "WIN" : controller.countRight.toString(),
                              style: TextStyle(
                                fontSize: controller.isWinRight ? 140 :180,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Visibility(
                              visible: homeCountroller.isEditScore,
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
            Positioned(
              top: 8,
              left: 8,
              child: Visibility(
                visible: homeCountroller.isEditScore,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    homeCountroller.setIsEditScore(false);
                  },
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              left: 8,
              child: Visibility(
                visible: !homeCountroller.isEditScore,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      tooltip: "Pengaturan",
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () => Get.toNamed('/settingPage'),
                    ),
                    Visibility(
                      visible: SettingController.to.isTimerBoard,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        child: Text(
                          "01:32:42",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: "Edit Score",
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        homeCountroller.setIsEditScore(true);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              left: 8,
              child: Visibility(
                visible: !homeCountroller.isEditScore,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 52),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Start",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
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
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Stop",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 52,
                      child: TextButton(
                        onPressed: () => controller.reset(),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 12,
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
          ],
        ),
      ),
    );
  }
}
