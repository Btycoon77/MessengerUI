import 'package:chat_ui/widgets/Category.dart';
import 'package:chat_ui/widgets/ChatListTile.dart';
import 'package:chat_ui/widgets/favouriteContacts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> navBar = ["Online", "Contacts", "Messages", "Groups"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Chats",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          iconSize: 25,
          onPressed: () {},
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 25,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Categorychat(navBar: navBar),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                color: Theme.of(context).accentColor,
              ),
              child: Column(
                children: [
                  FavouriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
