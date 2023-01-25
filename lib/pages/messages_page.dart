import 'package:chat_bot/Models/message_data.dart';
import 'package:chat_bot/resources/random_date.dart';
import 'package:chat_bot/resources/random_img_gen.dart';
import 'package:chat_bot/Models/stories_data.dart';
import 'package:chat_bot/screens/chat_screen.dart';
import 'package:chat_bot/utils/theme.dart';
import 'package:faker/faker.dart';
import 'package:chat_bot/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                _delegateMessageTiles // user defines widget below
                )),
      ],
    );
  }

  Widget _delegateMessageTiles(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = RandomDate.randomDate();
    return _MessageTitles(
        messageData: MessageModelData(
            senderName: faker.person.name(),
            message: faker.lorem.sentence(),
            messageDate: date.toString(),
            dateMessage: Jiffy(date).fromNow(),
            profilePicture: RandomImages.randomPicUrl()));
  }
}

//----------____________ Messages Row Tiles __________------------------
class _MessageTitles extends StatelessWidget {
  const _MessageTitles({Key? key, required this.messageData}) : super(key: key);

  final MessageModelData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Avatar.medium(
              url: messageData.profilePicture,
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      messageData.senderName,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          letterSpacing: 0.2,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                      height: 18,
                      child: Text(
                        messageData.message,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          letterSpacing: 0.1,
                          wordSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                  )
                ],
              )
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(messageData.dateMessage.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w600,
                  color:  AppColors.textFaded,
                ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.textLigth,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

//---------_______________Stories of the day_____________--------------

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 0,
        child: SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
                child: Text(
                  'Stories',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: AppColors.textFaded,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker(); //from faker pkg
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        child: _StoriesCard(
                          storyData: StoryData(
                            name: faker.person.firstName(),
                            url: RandomImages.randomPicUrl(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StoriesCard extends StatelessWidget {
  const _StoriesCard({Key? key, required this.storyData}) : super(key: key);
  final StoryData storyData;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//---------------------------------------------------------------------------
