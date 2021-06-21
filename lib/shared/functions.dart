import 'package:flutter/material.dart';

void postFrame(VoidCallback execute) {
  Future.delayed(Duration.zero, execute);
}
