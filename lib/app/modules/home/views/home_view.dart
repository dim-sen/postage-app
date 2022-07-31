import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postage/app/modules/home/controllers/home_controller.dart';
import 'package:postage/app/modules/home/views/widgets/province_box.dart';
import 'package:postage/app/modules/home/views/widgets/city_box.dart';
import 'package:postage/app/modules/home/views/widgets/weight_box.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postage Calculation'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ProvinceBox(type: "origin",),
          Obx(() => controller.hinddenCityOrigin.isTrue
              ? SizedBox()
              : CityBox(
                  provinceId:
                  controller.provinceIdOrigin.value,
                  type: "origin"
          )),
          ProvinceBox(type: "destination",),
          Obx(() => controller.hinddenCityDestination.isTrue
              ? SizedBox()
              : CityBox(
              provinceId:
              controller.provinceIdDestination.value,
              type: "destination"
          )),
          Weight(),
        ],
      ),
    );
  }
}