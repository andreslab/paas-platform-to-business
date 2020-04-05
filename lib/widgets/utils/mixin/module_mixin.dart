/*import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/providers/module_bar.dart';

mixin EventModuleBar {
  addModule(BuildContext context, ModuleBar provider, moduleId, businessId) async {
    final _moduleAPI = ModuleAPI();

    //call request
    final res = await _moduleAPI.setModuleByBusiness(context, moduleId, businessId);
    if (res == true) {
      print("SAVE SUCCESS");
      provider.indexPage = 0;
      provider.indexMenu = 0;
    } else {
      print("SAVE ERROR");
    }
  }

  void goModuleMain(ModuleBar provider) {
    provider.indexPage = 0;
    provider.indexMenu = 0;
  }

  void goModuleBusinessList(ModuleBar provider,){
    provider.indexPage = 1;
    provider.indexMenu = 1;
  }

  void goModuleList(ModuleBar provider,){
    provider.indexPage = 2;
    provider.indexMenu = 2;
  }

  void goModuleEdit(ModuleBar provider,){
    provider.indexPage = 3;
    provider.indexMenu = 3;
  }

  void showFilterView(){
    print("show filter");
  }

}*/
