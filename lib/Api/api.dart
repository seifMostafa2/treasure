// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:finology/Models/recent_model.dart';

class ApiProvider {
  Future<RecentPeoples> apiRecentPeoples() async {
    ///Limited requests 50 of this Key:-
    String Key = "G3J4UWYciji6J22liN_3Og";
    RecentPeoples objRecentPeoples = RecentPeoples();
    String query = "https://api.generated.photos/api/v1/faces?api_key=$Key";
    // "0";

    Map<String, dynamic> head = {
      "Content-Type": "application/json",
    };
    try {
      var response = await Dio().get(
        query,
        options: Options(
          headers: head,
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        objRecentPeoples = RecentPeoples.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return objRecentPeoples;
  }
}
