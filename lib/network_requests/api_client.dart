import 'dart:convert';
import 'dart:io';
import 'api_service.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'package:flutter/material.dart';

class ApiClient {
  ApiService _apiService = ApiService();

  getStatsResponse(StateLocation stateLocation,
      {String code = "", bool yesterday = false}) async {
    String endpoint = _getStatsEndpoint(
        location: stateLocation, code: code, yesterday: yesterday);
    String url = _apiService.statsUrl + endpoint;
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Json = json.decode(response.body);
        if (stateLocation == StateLocation.TOP_FIVE) {
          return Json.sublist(0, 6);
        }
        return Json;
      } else {
        throw FetchDataException("Failed to load stats");
      }
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
  }

  _getStatsEndpoint(
      {@required String code,
      bool yesterday,
      @required StateLocation location}) {
    if (location == StateLocation.GLOBAL) return "all?yesterday=$yesterday";
    String endpoint = "countries";

    if (location == StateLocation.SPECIFIC) {
      endpoint += "/" + code + "?strict=false&";
    } else if (location == StateLocation.TOP_FIVE) {
      endpoint += "?sort=cases&";
    } else if (location == StateLocation.ALL) {
      endpoint += "?";
    }
    return endpoint + "allowNull=false&yesterday=$yesterday";
  }

  _getDate(int days) {
    var now = DateTime.now();
    now = now.subtract(Duration(days: days));
    var date = now.toString();
    date = date.split(" ")[0];
    return date;
  }
}

enum StateLocation { GLOBAL, SPECIFIC, ALL, TOP_FIVE }
