import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

abstract class ToastService {
  void showToast(String message);
}

@injectable
class FlutterToastService implements ToastService {
  @override
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}