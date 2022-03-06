import 'package:get/get.dart';
import 'package:score_board/core/bindings/home_binding.dart';
import 'package:score_board/core/bindings/purchase_binding.dart';
import 'package:score_board/core/bindings/setting_binding.dart';
import 'package:score_board/ui/home/home_page.dart';
import 'package:score_board/ui/purchase/purchase_page.dart';
import 'package:score_board/ui/setting/setting_page.dart';

final List<GetPage> routes = [
  GetPage(
    name: '/',
    page: () => HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: '/settingPage',
    page: () => SettingPage(),
    binding: SettingBindings(),
  ),
  GetPage(
    name: '/purchasePage',
    page: () => PurchasePage(),
    binding: PurchaseBindings(),
  )
];
