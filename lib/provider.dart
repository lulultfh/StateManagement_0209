import 'package:flutter/material.dart';

//model
class FormProvider extends ChangeNotifier {
  String nama = "";
  String email = "";

  void setNama(String value){
    nama = value;
    notifyListeners();
  }
  void setEmail(String value){
    email = value;
    notifyListeners();
  }
}