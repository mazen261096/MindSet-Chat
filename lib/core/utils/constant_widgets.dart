
import 'package:flutter/material.dart';

class ConstantWidgets {

  static void errorDialog ({required BuildContext context , required String message}){

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(content: Text(message)
          );
        }
        );

  }
}