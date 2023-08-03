import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<String> {
  HomeCubit(super.initialState);
  final TextEditingController textEditingController = TextEditingController();

  void changeText(String? text) {
    if(text == null  ){
      textEditingController.text = "";
    }
    emit(text??'');
  }
}
