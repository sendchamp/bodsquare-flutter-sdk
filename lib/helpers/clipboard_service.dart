// import 'package:bodsquare/app/services/loading_service.dart';
import 'package:clipboard/clipboard.dart';

class ClipboardService {
  // final LoadingService _loadingService = Get.find();

  Future<void> copy(String text) async {
    await FlutterClipboard.copy(text);
  }
}
