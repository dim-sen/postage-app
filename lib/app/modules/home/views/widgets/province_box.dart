import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:postage/app/modules/home/controllers/home_controller.dart';
import 'package:postage/app/modules/home/province_model.dart';
import 'package:http/http.dart' as http;

class ProvinceBox extends GetView<HomeController> {
  const ProvinceBox({
    Key key,
    @required this.type
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: DropdownSearch <Province>(
        label: type == "origin" ? "Origin Province" : "Destination Province",
        showClearButton: true,
        onFind: (String filter) async {
          Uri uri = Uri.parse("https://api.rajaongkir.com/starter/province");
          try {
            final response = await http.get(
              uri,
              headers: {
                "key": "38854b0670b9a8b40a49e3d1bc131ed7",
              },
            );

            var data = json.decode(response.body) as Map<String, dynamic>;
            var provinceList = data["rajaongkir"]["results"] as List<dynamic>;
            var models = Province.fromJsonList(provinceList);
            return models;

          } catch (error) {
            print(error);
            return List<Province>.empty();
          }
        },
        onChanged: (province) {
          if (province != null) {
            if (type == "origin") {
              controller.hinddenCityOrigin.value = false;
              controller.provinceIdOrigin.value = province.provinceId;
            } else {
              controller.hinddenCityDestination.value = false;
              controller.provinceIdDestination.value = province.provinceId;
            }
          } else {
            if (type == "origin") {
              controller.hinddenCityOrigin.value = true;
              controller.provinceIdOrigin.value = "0";
            } else {
              controller.hinddenCityDestination.value = true;
              controller.provinceIdDestination.value = "0";
            }
          }
        },
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            hintText: "Search Province"
        ),
        popupItemBuilder: (context, item, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal:20,
              vertical: 15,
            ),
            child: Text(
              "${item.province}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
        itemAsString: (item) => item.province,
      ),
    );
  }
}
