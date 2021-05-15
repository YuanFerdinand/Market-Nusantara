import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class ChatMessage extends StatefulWidget {
  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  var messages_list = [
    {
      "picture": "assets/processor/corei9.jpg",
      "text": "Hallo, apakah barang masih tersedia?",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: messages_list.length,
        itemBuilder: (context, index) {
          return Single_cart_prod(
            chat_picture: messages_list[index]["picture"],
            chat_text: messages_list[index]["text"],
          );
        });
  }
}

class Single_cart_prod extends StatelessWidget {
  final chat_picture;
  final chat_text;

  Single_cart_prod({
    this.chat_picture,
    this.chat_text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset("assets/etc/user.png"),
          title: new Bubble(
            margin: BubbleEdges.only(top: 10),
            alignment: Alignment.topLeft,
            nipWidth: 20,
            nipHeight: 10,
            nip: BubbleNip.leftTop,
            child: Text('Hallo, apakah barang masih tersedia?'),
          ),
        ),
        Bubble(
          margin: BubbleEdges.only(top: 10),
          alignment: Alignment.topRight,
          nipWidth: 20,
          nipHeight: 10,
          nip: BubbleNip.rightTop,
          color: Colors.lightBlue[50],
          child: Text(
              'Barang Masih tersedia, untuk harga sesuai dengan keterangan',
              textAlign: TextAlign.left),
        ),
      ],
    );
  }
}
