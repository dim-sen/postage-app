import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:postage/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:postage/app/modules/home/city_model.dart';
import 'package:http/http.dart' as http;

class CityBox extends GetView<HomeController> {
  const CityBox({
    Key key,
    @required this.provinceId,
    @required this.type
  }) : super(key: key);

  final String provinceId;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: DropdownSearch <City>(
        label: type == "origin" ? "Origin City / Districts" : "Destination City / Districts",
        showClearButton: true,
        onFind: (String filter) async {
          Uri uri = Uri.parse("https://api.rajaongkir.com/starter/city?province=$provinceId");
          try {
            final response = await http.get(
              uri,
              headers: {
                "key": "38854b0670b9a8b40a49e3d1bc131ed7",
              },
            );

            var data = json.decode(response.body) as Map<String, dynamic>;
            var cityList = data["rajaongkir"]["results"] as List<dynamic>;
            var models = City.fromJsonList(cityList);
            return models;

          } catch (error) {
            print(error);
            return List<City>.empty();
          }
        },
        onChanged: (city) {
          if (city != null) {
            if (type == "origin") {
              controller.cityIdOrigin.value = city.cityId;
            } else {
              controller.cityIdDestination.value = city.cityId;
            }
          } else {
            if (type == "origin") {
              print("None origin");
            } else {
              print("None destination");
            }
          }
        },
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            hintText: "Search City / Districts"
        ),
        popupItemBuilder: (context, item, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal:20,
              vertical: 15,
            ),
            child: Text(
              "${item.type} ${item.cityName}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
        itemAsString: (item) => "${item.type} ${item.cityName}",
      ),
    );
  }
}