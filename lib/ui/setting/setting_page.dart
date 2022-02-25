import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:score_board/core/controller/setting_controller.dart';
import 'package:score_board/utils/colors.dart';
import 'package:score_board/utils/size_config.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Pengaturan"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Reset",
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
                        "Label Board",
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
                                    text: "Text ",
                                    children: [
                                      TextSpan(
                                        text: "Kiri",
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
                                  width: 80,
                                  child: TextFormField(
                                    initialValue: controller.textLeft,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(8.0),
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (String value) =>
                                        controller.setTextLeft(value),
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
                                    text: "Text ",
                                    children: [
                                      TextSpan(
                                        text: "Kanan",
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
                                  width: 80,
                                  child: TextFormField(
                                    initialValue: controller.textRight,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(8.0),
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (String value) =>
                                        controller.setTextRight(value),
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
                          text: "Warna Board : ",
                          children: [
                            TextSpan(
                              text:
                                  controller.isPositionBoard ? "Kanan" : "Kiri",
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
                "Angka Naik",
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(
                width: 80,
                child: TextFormField(
                  initialValue: controller.textIncrement,
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
                  onChanged: (String value) =>
                      controller.setTextIncrement(value),
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
                "Limit Maksimal",
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
                        width: 80,
                        child: TextFormField(
                          initialValue: controller.textLimit,
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
                          onChanged: (String value) =>
                              controller.setTextLimit(value),
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
              "Timer Waktu",
              style: TextStyle(fontSize: 14.0),
            ),
            value: controller.isTimerBoard,
            onChanged: (bool i) {
              print(i);
              controller.setTimerBoard(i);
            }),
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
