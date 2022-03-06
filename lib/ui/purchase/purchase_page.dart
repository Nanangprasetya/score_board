import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:score_board/core/controller/purchase_controller.dart';
import 'package:score_board/utils/colors.dart';
import 'package:score_board/utils/images.dart';

class PurchasePage extends GetView<PurchaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              backgroundColor: AppColors.black,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text("restore".tr),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _logo(),
                    SizedBox(height: 36.0),
                    _message(),
                    SizedBox(height: 36.0),
                    _button(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.0,
          width: 40.0,
          child: Image.asset(AppImages.logo),
        ),
        SizedBox(width: 14.0),
        Text(
          "Score Board",
          style: TextStyle(color: AppColors.white, fontSize: 14.0),
        ),
      ],
    );
  }

  Widget _message() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "title.ads".tr,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32.0,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 14.0),
        Text(
          "msg.ads".tr,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.0,
            letterSpacing: 0.25,
          ),
        )
      ],
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        
      },
      child: Text("buy.now".tr),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 14.0,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
