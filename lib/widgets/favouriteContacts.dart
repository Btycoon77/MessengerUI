import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:chat_ui/screen/chatscreen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  final User user;
  const FavouriteContacts({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Favourite Contacts",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
            ],
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 12),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                Message message = chats[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(user: message.sender)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage(favourites[index].imageUrl),
                        ),
                        Text(
                          favourites[index].name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
