import 'dart:math';

class RandomDate{
  static DateTime randomDate(){
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: Random().nextInt(200000)));
  }
}