import 'package:flutter/material.dart';
import 'package:whats_app_clone/models/message.dart';

class Chat {
  final String name;
  final String pictureUrl;
  final List<Message> messages;

  Chat({@required this.name, @required this.pictureUrl, @required this.messages});
}