import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../model/dashboard.dart';

class DashboardAPI {

  Future<List<DashboardModel>> getBusinessList(BuildContext context) async {

    try {

      List<DashboardModel> data = new List();

      var uri = Uri.http(AppConfig.apiHost, "/api/business");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET BUSINESS LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final business = parsed["data"] as List;
        print("response 200: ${response.body}");
        print("response 200: ${business.toString()}");
        
        //save business
        for(var i = 0; i < business.length; i++) {
            data.add(DashboardModel(
              business[i]["id"], 
              business[i]["name"], 
              business[i]["manager_id"], 
              business[i]["type_id"], 
              business[i]["num_modules"],
              business[i]["created"]));
        }
        
        return data;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getCategoriesList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      /* Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      }); */
      return null;
    }
  }
}