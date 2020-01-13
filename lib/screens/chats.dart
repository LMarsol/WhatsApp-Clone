import 'package:flutter/material.dart';
import 'package:whats_app_clone/models/chat.dart';
import 'package:whats_app_clone/services/api.dart';
import 'package:whats_app_clone/shared/colors.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<Chat> _chats = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await ApiService().fetchData().then((response) {
      setState(() {
        _chats = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12.0),
      shrinkWrap: true,
      children: _buildChats(),
    );
  }

  List<Widget> _buildChats() {
    List<Widget> widgets = [];
    
    _chats.forEach((chat) => widgets.add(_buildChat(chat)));

    List<Widget> tiles = ListTile.divideTiles(
      context: context,
      tiles: widgets
    ).toList();

    return tiles;
  }

  Widget _buildChat(Chat chat) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.all(8.0),
      leading: CircleAvatar(
        child: Image.network(chat.pictureUrl),
        radius: 26,
      ),
      title: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                chat.name,
                style: TextStyle(
                  color: AppColors.userName,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  chat.messages.last.message,
                  style: TextStyle(
                    color: AppColors.lastMessage,
                    fontSize: 16,
                  ),
                 ),
              ),
            ],
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Text('10:34 AM'),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 25,
            height: 25,
            child: Center(
              child: Text(
                chat.messages.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}