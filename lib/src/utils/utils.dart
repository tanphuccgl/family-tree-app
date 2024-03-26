import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Utils {
  static String getPrefix(String input, String delimiter) {
    List<String> parts = input.split(delimiter);
    return parts.first;
  }

  static Timestamp convertMapToTimestamp(dynamic data) {
    if (data != null) {
      if (data is int) {
        return Timestamp.fromMillisecondsSinceEpoch(data);
      } else if (data is Timestamp) {
        return data;
      }
    }
    return Timestamp.now();
  }

  static bool get isWebDesktop {
    return !isWebMobile && kIsWeb;
  }

  static bool get isWebMobile {
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    return isWebMobile;
  }

  static bool get isWebMobileAndroid {
    final result = kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    return result;
  }

  static bool get isWebMobileIOS {
    final result = kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    return result;
  }
}
