import 'package:elancer/utils.dart';
import 'package:flutter/material.dart';

final kTitleStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  height: 1.2,
);
final customContinerStyle = BoxDecoration(
    color: blue,
    borderRadius: new BorderRadius.only(
      topLeft: const Radius.circular(10.0),
      topRight: const Radius.circular(10.0),
      bottomLeft: const Radius.circular(10.0),
      bottomRight: const Radius.circular(10.0),
    ));
final normalContinerStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: new BorderRadius.only(
      topLeft: const Radius.circular(10.0),
      topRight: const Radius.circular(10.0),
      bottomLeft: const Radius.circular(10.0),
      bottomRight: const Radius.circular(10.0),
    ));