import 'package:chat_bot/resources/random_img_gen.dart';
import 'package:chat_bot/utils/theme.dart';
import 'package:chat_bot/widgets/avatar.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Text("Stories", style: MyTextStyles.heading2,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                const SizedBox(width: 8,),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
                Avatar.medium(url: RandomImages.randomPicUrl(),),
              ],
            ),
          )

        ],
      ),
    );
  }
}


//--------- Stories of the day --------------

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Stories", style: MyTextStyles.heading2,),
        Row(
          children: [

          ],
        )

      ],
    );
  }
}
