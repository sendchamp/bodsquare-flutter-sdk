import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_model.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/get_all_conversations.dart';
import 'package:get/state_manager.dart';

class ConversationsService extends GetxService {
  RxList<GetAllConversationsData> allConversationsList =
      RxList<GetAllConversationsData>();
  Rx<ConversationModel> conversation =
      Rx<ConversationModel>(ConversationModel());
}
