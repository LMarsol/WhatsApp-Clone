import 'package:whats_app_clone/models/chat.dart';
import 'package:whats_app_clone/models/message.dart';

class ApiService {
  Future<dynamic> fetchData() async {
    //get data from api
    Message message_1 = Message(message: "Hey!", time: DateTime.now());
    Message message_2 = Message(message: "How u doing?", time: DateTime.now());
    Message message_3 = Message(message: "I miss you!", time: DateTime.now());

    Chat chat_1 = Chat(
      name: 'Stephan Serowy',
      pictureUrl: 'https://p7.hiclipart.com/preview/312/283/679/avatar-computer-icons-user-profile-business-user-avatar.jpg',
      messages: [message_1, message_2, message_3]
    );

    Chat chat_2 = Chat(
      name: 'Scott Adam',
      pictureUrl: 'https://i7.pngguru.com/preview/340/946/334/avatar-user-computer-icons-software-developer-avatar-thumbnail.jpg',
      messages: [message_1, message_2, message_3]
    );

    Chat chat_3 = Chat(
      name: 'Loie Favre',
      pictureUrl: 'https://i7.pngguru.com/preview/555/703/598/computer-icons-avatar-woman-user-avatar.jpg',
      messages: [message_1, message_2, message_3]
    );

    List<Chat> response = [chat_1, chat_2, chat_3];
    // response = await Future.delayed(Duration(seconds: 5)).then((_) {
    //   response = 
    // });

    return response;
  }
}