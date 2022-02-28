import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:score_board/core/controller/setting_controller.dart';
import 'package:score_board/utils/colors.dart';
import 'package:score_board/utils/field_length.dart';
import 'package:score_board/utils/images.dart';
import 'package:score_board/utils/size_config.dart';
import 'package:score_board/widget/switch_icon.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
  print(controller.indexSwitch);
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("setting".tr),
          actions: [
            TextButton(
              onPressed: () => controller.resetAll(),
              child: Text(
                "reset".tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text(
                        "label.board".tr,
                        style: TextStyle(fontSize: 14.0),
                      ),
                      value: controller.isLabelBoard,
                      onChanged: (bool i) => controller.setLabelBoard(i),
                    ),
                    Visibility(
                      visible: controller.isLabelBoard,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "text".tr,
                                    children: [
                                      TextSpan(
                                        text: "left".tr,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: controller.labelLeftBoardColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Form(
                                    key: controller.keyTextLeft,
                                    child: TextFormField(
                                      initialValue: controller.textLeft,
                                      autovalidateMode: AutovalidateMode.always,
                                      autocorrect: true,
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12.0),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.all(8.0),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (i) {
                                        if (i.isEmpty) {
                                          return "empty.value".tr;
                                        }
                                        if (i.length > FieldLength.maxLabel) {
                                          return  'max'.tr + "${FieldLength.maxLabel}";
                                        }
                                        return null;
                                      },
                                      onChanged: (String value) =>
                                          controller.setTextLeft(value),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "text".tr,
                                    children: [
                                      TextSpan(
                                        text: "right".tr,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color:
                                              controller.labelRightBoardColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Form(
                                    key: controller.keyTextRight,
                                    child: TextFormField(
                                      initialValue: controller.textRight,
                                      autovalidateMode: AutovalidateMode.always,
                                      autocorrect: true,
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.all(8.0),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (i) {
                                        if (i.isEmpty) {
                                          return "empty.value".tr;
                                        }
                                        if (i.length > FieldLength.maxLabel) {
                                          return 'max'.tr + "${FieldLength.maxLabel}";
                                        }
                                        return null;
                                      },
                                      onChanged: (String value) =>
                                          controller.setTextRight(value),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SwitchListTile(
                      title: Text.rich(
                        TextSpan(
                          text: "color.board".tr,
                          children: [
                            TextSpan(
                              text:
                                  controller.isPositionBoard ? "right".tr : "left".tr,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      value: controller.isPositionBoard,
                      onChanged: (bool i) => controller.setPositionBoard(i),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: SizeConfig.screenWidth / 4,
                        child: Wrap(
                          children: ColorBoard.listColorBoard.map((e) {
                            return InkWell(
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.black,
                                ),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: e.color,
                                  ),
                                  child: _dotColor(controller, e.idColor),
                                ),
                              ),
                              onTap: () => controller.setColorBoard(e.color),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            VerticalDivider(),
            Expanded(
              child: SingleChildScrollView(
                child: _rightBody(controller),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightBody(SettingController controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "increment".tr,
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(
                width: 100,
                child: Form(
                  key: controller.keyTextIncrement,
                  child: TextFormField(
                    initialValue: controller.textIncrement,
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                    ),
                    validator: (i) {
                      if (i.isEmpty) {
                        return "empty.value".tr;
                      }
                      if (i.length > FieldLength.maxIncrement) {
                        return  "max".tr + "${FieldLength.maxIncrement}";
                      }
                      return null;
                    },
                    onChanged: (String value) =>
                        controller.setTextIncrement(value),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "limit.max".tr,
                style: TextStyle(fontSize: 14.0),
              ),
              Row(
                children: [
                  Switch(
                    value: controller.isLimitBoard,
                    onChanged: (bool i) => controller.setLimitBoard(i),
                  ),
                  Visibility(
                    visible: controller.isLimitBoard,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: SizedBox(
                        width: 100,
                        child: Form(
                          key: controller.keyTextLimit,
                          child: TextFormField(
                            initialValue: controller.textLimit,
                            autovalidateMode: AutovalidateMode.always,
                            autocorrect: true,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(),
                            ),
                            validator: (i) {
                              if (i.isEmpty) {
                                return "empty.value".tr;
                              }
                              if (i.length > FieldLength.maxLimit) {
                                return "max".tr + "${FieldLength.maxLimit}";
                              }
                              return null;
                            },
                            onChanged: (String value) =>
                                controller.setTextLimit(value),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SwitchListTile(
          title: Text(
            "timer".tr,
            style: TextStyle(fontSize: 14.0),
          ),
          value: controller.isTimerBoard,
          onChanged: (bool i) {
            print(i);
            controller.setTimerBoard(i);
          },
        ),
        ListTile(
          title: Text("change.language".tr),
          trailing: AppToggleSwitch(
            minHeight: 20.0,
            minWidth: 34.0,
            initialLabelIndex: controller.indexSwitch,
            inactiveBgColor: AppColors.disable,
            activeFgColor: AppColors.blue,
            inactiveFgColor: AppColors.text2,
            totalSwitches: 2,
            iconSize: 24.0,
            borderWidth: 2.0,
            radiusStyle: true,
            activeBgColor: [AppColors.white],
            borderColor: [AppColors.disable],
            icons: [Image.asset(AppImages.en), Image.asset(AppImages.id)],
            onToggle: (index) => controller.setIndexSwitch(index),
          ),
        )
      ],
    );
  }

  Widget _dotColor(SettingController controller, int idColor) {
    if ((!controller.isPositionBoard &&
            controller.labelLeftBoardColor.value == idColor) ||
        controller.isPositionBoard &&
            controller.labelRightBoardColor.value == idColor) {
      return Container(
        margin: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black,
        ),
      );
    }
    return Container();
  }
}
