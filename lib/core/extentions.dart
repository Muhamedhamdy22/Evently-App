import 'package:flutter/material.dart';

extension ThemeContextExtention on BuildContext {
  getLargeTittle(){
    return Theme.of(this).textTheme.titleLarge;
  }
}