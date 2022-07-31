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
            autocorrect: false,
            controller: controller.weight,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: "Weight",
              hintText: "Weight of the item",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Container(
          width: 150,
          child: DropdownSearch<String>(
            mode: Mode.BOTTOM_SHEET,
            showSelectedItem: true,
            items: ["(Kg) Kilogram", "(Hg) Ons", "(g) Gram", "(mg) Miligram"],
            label: "Unit Weight",
            selectedItem: "(g) Gram",
            onChanged: ((value) => controller.changeWeight(value)),
          ),
        )
      ],
    );
  }

}