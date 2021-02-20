import 'package:flutter/widgets.dart';

class AnonUserInfo {
  /// Internal, anonymous user id.
  final String _uid;

  AnonUserInfo(String uid) : _uid = uid;

  String get uid => _uid;
}