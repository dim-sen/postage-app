import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:postage/app/modules/home/controllers/home_controller.dart';
import 'package:postage/app/modules/home/province_model.dart';
import 'package:http/http.dart' as http;

class Weight extends GetView<HomeController> {
  const Weight({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.weight,
          ),
        ),
      ],
    );
  }

}