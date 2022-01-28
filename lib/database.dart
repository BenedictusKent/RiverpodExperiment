import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) => Database());

class Database {
  static int one = 0;
  static int two = 0;

  Future<String> getQuestionData() {
    Random rng = Random();
    one = rng.nextInt(100);
    two = rng.nextInt(100);
    String text = '$one + $two';
    return Future.delayed(Duration(seconds: 2), () {
      return text;
    });
  }
}
