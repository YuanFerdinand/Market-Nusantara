import 'package:flutter/material.dart';
import 'package:market_nusantara/produk/chat_messages.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          toolbarHeight: 80,
          centerTitle: false,
          backgroundColor: Colors.lightBlue,
          title: Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                    "assets/etc/user.png",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      "user.name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: ChatMessage(),
        bottomNavigationBar: SizedBox(
          width: 2,
          child: Container(
            color: Colors.white,
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Colors.grey[500],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type your Message...',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic_none_outlined,
                          color: Colors.grey[500],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        new Icon(
                          Icons.send_outlined,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class TextChat extends StatelessWidget {
  final messages;

  TextChat({
    this.messages,
  });
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
