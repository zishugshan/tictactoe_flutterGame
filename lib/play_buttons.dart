import 'package:flutter/material.dart';

class PlayButtons {
  final id;
  String text;
  Color bg;
  bool enabled;

  PlayButtons(
      {this.id, this.text = "", this.bg = Colors.white, this.enabled = true});
}