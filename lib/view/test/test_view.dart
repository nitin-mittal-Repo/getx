import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_model/utils/appTheme.dart';
import 'package:getx_model/view/test/test_logic.dart';
import 'package:getx_model/widgets/commonButtonWidget.dart';
import 'package:getx_model/widgets/commonTextWidget.dart';


class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestLogic>(
        init: TestLogic(state: Get.find()),
        builder: (controller) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: [
                Obx(() {
                  return CommonTextWidget(
                      heading: controller.textValue.value.toString(),
                      fontSize: 14,
                      color: ThemeProvider.blackColor);
                }),


                CommonButtonWidget(
                    onPressed: () => controller.increment(),
                title: 'Increment'),


                CommonButtonWidget(
                    onPressed: () => controller.decrement(),
                    title: 'decrement'),
              ],
            ),
          );
        });
  }
}

