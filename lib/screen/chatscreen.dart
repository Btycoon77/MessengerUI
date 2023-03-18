import 'package:chat_ui/constant.dart';
import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final User user;

  ChatScreen({Key key, this.user}) : super(key: key);

  _buildMessage(Message message, bool isMe, BuildContext context) {
    Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: (isMe)
          ? const EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : const EdgeInsets.only(top: 8, bottom: 8, right: 60),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      decoration: (isMe)
          ? BoxDecoration(
              color: recentChatColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ))
          : BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 15, top: 8, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.time,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              message.text,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

    if (isMe) {
      return msg;
    } else {
      return Row(
        children: [
          msg,
          IconButton(
              icon: message.isLiked == true
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: (message.isLiked) ? Colors.red : Colors.blueGrey,
              onPressed: () {})
        ],
      );
    }
  }

  _buildMessageComposer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Theme.of(context).accentColor,
      ),
      height: 80,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.photo), iconSize: 25, onPressed: () {}),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Send a Message...",
            ),
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
          )),
          IconButton(icon: Icon(Icons.send), iconSize: 25, onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          user.name,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Icon(
            Icons.more_vert,
            size: 20,
            color: Colors.white,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          return FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                  color: Colors.white,
                ),
                child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe, context);
                    }),
              ),
            ),
            _buildMessageComposer(context),
          ],
        ),
      ),
    );
  }
}
