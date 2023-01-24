import 'package:chat_bot/pages/calls_page.dart';
import 'package:chat_bot/pages/contacts_page.dart';
import 'package:chat_bot/pages/messages_page.dart';
import 'package:chat_bot/pages/notifications_page.dart';
import 'package:chat_bot/resources/random_img_gen.dart';
import 'package:chat_bot/widgets/appbar_leading_icons.dart';
import 'package:chat_bot/widgets/avatar.dart';

import 'package:flutter/cupertino.dart';
import 'package:chat_bot/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final pages = const[
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];
  var indices = 0;

  final pagesTitle = [
    "Messages",
    "Notifications",
    "Calls",
    "Contacts"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(pagesTitle[indices], style: const
        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
        actions:[
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Avatar.small(url: RandomImages.randomPicUrl(),),
          )
        ],
        leadingWidth: 54,
        leading: Center(
          child: IconBackgroundLeading(icon: CupertinoIcons.search, onTap: (){
            debugPrint("Todo Search");
          }),
        ),
      ),
      body: pages[indices],
      bottomNavigationBar: _BottomNavBar(
        onSelectedItem: (indexNavItem){
          setState(() {
            indices = indexNavItem;
          });
        },
      ),
    );
  }
}



//Nav Bar structure
class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar({Key? key, required this.onSelectedItem}) : super(key: key);

  final ValueChanged<int> onSelectedItem;

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarElements(
            index: 0,
            lable: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            onTap: widget.onSelectedItem,
          ),

          _NavBarElements(
            index: 1,
            lable: 'Notifications',
            icon: CupertinoIcons.bell_fill,
            onTap: widget.onSelectedItem,
          ),

          _NavBarElements(
            index: 2,
            lable: 'Calls',
            icon: CupertinoIcons.phone_fill,
            onTap: widget.onSelectedItem,
          ),

          _NavBarElements(
            index: 3,
            lable: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            onTap: widget.onSelectedItem,
          ),
        ],
      ),
        );
  }
}


// Nav elements
class _NavBarElements extends StatelessWidget {
  const _NavBarElements({Key? key,
    required this.lable,
    required this.icon,
    required this.index,
    required this.onTap
  }) : super(key: key);



  final String lable;
  final IconData icon;
  final int index;
  final ValueChanged<int> onTap; //to sense the tap then its handling function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //for element icon
          Icon(icon, size: 20,),

          //for element label
          Text(lable, style: MyTextStyles.iconText,),

          const SizedBox(height: 20,) //Bottom Space
        ],
      ),
    );
  }
}

