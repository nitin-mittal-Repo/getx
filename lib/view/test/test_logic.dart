import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_state.dart';

class TestLogic extends GetxController {
  final TestState state;

  TestLogic({required this.state});


  RxInt textValue = 0.obs;


  increment(){
    textValue.value += 50;
  }

  decrement(){
    textValue.value += 50;
  }




    getProfileData() async {
      final response = await state.getPrivate({'endif': 'NASDAQ'});
      final data = response.data;
      debugPrint("Profile Data: $data");
  }


}
