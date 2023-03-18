import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:chat_ui/screen/chatscreen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  final User user;
  const RecentChats({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          color: Colors.white,
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              Message message = chats[index];
              return Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 20, 5.0),
                padding: const EdgeInsets.only(right: 20.0, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      bottomRight: Radius.circular(22)),
                  color:
                      message.unread == true ? Color(0xFFFFEFEE) : Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              user: message.sender,
                            )));
                  },
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(message.sender.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(message.sender.name),
                  subtitle: message.unread == true
                      ? Text(message.text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))
                      : Text(
                          message.text,
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                  isThreeLine: true,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        message.time,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      message.unread == true
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "NEW",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          : Text(""),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
