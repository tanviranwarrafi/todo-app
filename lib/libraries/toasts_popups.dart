import 'package:app/themes/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ToastPopup {
  ToastPopup._();
  static void onToast({required String message, required bool isTop}) {
    var length = Toast.LENGTH_LONG;
    var gravity = isTop ? ToastGravity.TOP : ToastGravity.BOTTOM;
    Fluttertoast.showToast(msg: message, textColor: white, fontSize: 16, toastLength: length, backgroundColor: primary, gravity: gravity);
  }

  static void onSuccess({required String message, required bool isTop}) {
    var length = Toast.LENGTH_LONG;
    var gravity = isTop ? ToastGravity.TOP : ToastGravity.BOTTOM;
    Fluttertoast.showToast(msg: message, textColor: white, fontSize: 16, backgroundColor: success, toastLength: length, gravity: gravity);
  }

  static void onWarning({required String message, required bool isTop}) {
    var length = Toast.LENGTH_LONG;
    var gravity = isTop ? ToastGravity.TOP : ToastGravity.BOTTOM;
    Fluttertoast.showToast(msg: message, textColor: white, fontSize: 16, backgroundColor: warning, toastLength: length, gravity: gravity);
  }

  static void onError({required String message, required bool isTop}) {
    var length = Toast.LENGTH_LONG;
    var gravity = isTop ? ToastGravity.TOP : ToastGravity.BOTTOM;
    Fluttertoast.showToast(msg: message, textColor: white, fontSize: 16, backgroundColor: error, toastLength: length, gravity: gravity);
  }
}
