import 'package:uplink/chat/data/datasource/chat.remote_datasource.dart';
import 'package:uplink/chat/data/repositories/chat.repository.dart';
import 'package:uplink/chat/domain/chat_message.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class ChatRepositoryImpl implements IChatRepository {
  const ChatRepositoryImpl(
    this._remoteDatasource,
  );

  final ChatData _remoteDatasource;

  @override
  String createConversation({required User user}) {
    return _remoteDatasource.createConversation(user: user);
  }

  @override
  ChatMessage? getLastMessageReceived({
    required String conversationID,
    required User user,
  }) {
    return _remoteDatasource.getLastMessageReceived(
      conversationID: conversationID,
      user: user,
    );
  }

  @override
  void sendMessage({required ChatMessage newMessage}) {
    _remoteDatasource.sendMessage(newMessage);
  }

  @override
  List<ChatMessage> getAllMessagesInConversation({
    required String conversationID,
    required User user,
  }) {
    return _remoteDatasource.gettAllMessagesInConversation(
      conversationID: conversationID,
      user: user,
    );
  }
}
