import 'user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.isLiked, this.sender, this.text, this.time, this.unread});
}

final User currentUser =
    User(name: "Greg", id: 0, imageUrl: "asset/images/greg.jpg");

final User john =
    User(name: "John", id: 1, imageUrl: "asset/images/john.jpg");

final User olivia =
    User(name: "Olivia", id: 2, imageUrl: "asset/images/olivia.jpg");

final User sam = User(name: "Sam", id: 3, imageUrl: "asset/images/sam.jpg");

final User steven =
    User(name: "Steven", id: 4, imageUrl: "asset/images/steven.jpg");

final User gulliver =
    User(name: "Gulliver", id: 5, imageUrl: "asset/images/gulliver.jpg");

final User maria =
    User(name: "Maria", id: 6, imageUrl: "asset/images/maria.jpg");

final User sia = User(name: "Sia", id: 7, 
imageUrl: "asset/images/sia.jpg");

List<User> favourites = [sam, steven, olivia, john, gulliver];

List<Message> chats = [
  Message(
    sender: john,
    time: "5:30",
    text: "Hey! how is it going?What did you do today",
    isLiked: false,
    unread: true,
  ),

   Message(
    sender: gulliver,
    time: "2:30",
    text: "Hey! how is it going?What did you do today",
    isLiked: false,
    unread: true,
  ),
  
   Message(
    sender: sia,
    time: "7:30",
    text: "Hey! how is it going?What did you do today",
    isLiked: false,
    unread: false,
  ),
  
   Message(
    sender: steven,
    time: "8:30",
    text: "Hey! how is it going?What did you do today",
    isLiked: false,
    unread: true,
  ),
  
   Message(
    sender: maria,
    time: "9:30",
    text: "Hey! how is it going?What did you do today",
    isLiked: false,
    unread: false,
  ),
  
   Message(
    sender: olivia,
    time: "9:00",
    text: "Hey! how is it going?What did you do today",
    isLiked: false,
    unread: true,
  ),
  
];

//Examples messages in the chat Screen

List<Message> messages = [
  Message(
    sender: currentUser,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: gulliver,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: sam,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sia,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];

