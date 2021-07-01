import 'package:flutter/material.dart';

class CategoryChat extends StatefulWidget {
  @override
  _CategoryChatState createState() => _CategoryChatState();
}

class _CategoryChatState extends State<CategoryChat> {
  int selectedIndex = 0;
  final List<String> categories = ['All Messages', 'New'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                90.0,
                10.0,
                30.0,
                10.0,
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.white60,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
