import 'package:taska_app/database/services/web/urls.dart';

import '../../../model/user_model.dart';
import 'http_client.dart';

class WebUserServices {

  static final WebUserServices _instance = WebUserServices._private();

  WebUserServices._private();

  factory WebUserServices() {
    return _instance;
  }

  Future<UserModel?> loginUser(String userName, String password) async {
    Map<String, String> body = {'username': userName, 'password': password};
    Map<String, dynamic> response = await HTTPClient().postRequest(
        url: kLoginURL,
        requestBody: body
    );
    if(response.containsKey('error')){
      throw Exception(response['error']);
    }

    if(response['data'] != null){
      return UserModel.fromJson(response['data']);
    }
    return null;
  }
}