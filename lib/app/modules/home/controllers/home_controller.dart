import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var hinddenCityOrigin = true.obs;
  var provinceIdOrigin = "0".obs;
  var cityIdOrigin = "0".obs;
  var hinddenCityDestination = true.obs;
  var provinceIdDestination = "0".obs;
  var cityIdDestination = "0".obs;

  double initialWeight = 0.0;
  String unit = "Gram";

  TextEditingController weight;

  void changeWeight(String value) {

  }

  @override
  void onInit() {
    weight = TextEditingController(text: "$initialWeight");
    super.onInit();
  }

  @override
  void onClose() {
    weight.dispose();
    super.onClose();
  }
}