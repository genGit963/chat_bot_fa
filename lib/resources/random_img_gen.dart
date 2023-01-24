import 'dart:math';

abstract class RandomImages{
  static final random = Random();

  static String randomPicUrl(){
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }
  //https://picsum.photos/seed/3/300/300'
  static DateTime randomDate(){
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
  }
}