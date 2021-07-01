import 'package:market_nusantara/model/userChat_model.dart';

class Message {
  final User sender;
  final User sent;
  final String time;
  final String text;
  final bool baru;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.sent,
    this.time,
    this.text,
    this.baru,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/magnus.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/magnus.jpg',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/magnus.jpg',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'assets/magnus.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'assets/magnus.jpg',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'assets/magnus.jpg',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/magnus.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/magnus.jpg',
);

List<User> orang = [
  User(
    id: 1,
    name: 'greg',
    imageUrl: 'assets/magnus.jpg',
  ),
  User(
    id: 2,
    name: 'james',
    imageUrl: 'assets/magnus.jpg',
  ),
  User(
    id: 3,
    name: 'john',
    imageUrl: 'assets/magnus.jpg',
  ),
  User(
    id: 4,
    name: 'olivia',
    imageUrl: 'assets/magnus.jpg',
  ),
  User(
    id: 5,
    name: 'sam',
    imageUrl: 'assets/magnus.jpg',
  ),
  User(
    id: 6,
    name: 'shopia',
    imageUrl: 'assets/magnus.jpg',
  ),
  User(
    id: 7,
    name: 'steven',
    imageUrl: 'assets/magnus.jpg',
  ),
];

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    sent: currentUser,
    time: '5:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    baru: true,
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    sent: currentUser,
    time: '4:30 PM',
    text: 'Hey, Apakah core i-7 masih tersedia?',
    baru: true,
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    sent: currentUser,
    time: '3:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    sent: currentUser,
    time: '2:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    baru: true,
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    sent: currentUser,
    time: '1:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    sent: currentUser,
    time: '12:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    sent: currentUser,
    time: '11:30 AM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    sent: currentUser,
    time: '6:45 PM',
    text: 'Terimakasih!',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    sent: james,
    time: '5:35 PM',
    text:
        'Terimakasih sudah berkunjung!, silahkan pilih barang yang ada di home! semua barang tersedia, dengan harga yang sama',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    sent: currentUser,
    time: '5:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    sent: currentUser,
    time: '4:30 PM',
    text: 'Hey, Apakah core i-7 masih tersedia?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    sent: currentUser,
    time: '3:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    sent: currentUser,
    time: '2:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    baru: true,
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    sent: currentUser,
    time: '1:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    sent: currentUser,
    time: '12:30 PM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    sent: currentUser,
    time: '11:30 AM',
    text: 'Hey, Apakah core i-9 masih tersedia?',
    isLiked: false,
    unread: false,
  ),
];
