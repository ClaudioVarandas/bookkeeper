import 'package:bookkeeper/data/remote/endpoints/auth_endpoints.dart';
import 'package:bookkeeper/data/remote/models/token_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  AuthEndpoints authEndpoints;
  SharedPreferences sharedPreferences;

  AuthService(this.authEndpoints,this.sharedPreferences);

  Future<bool> doLogin(String username,String password){
    return this.authEndpoints.postLogin(username, password).then((response) {

      Token token = new Token.fromJson(response.data);
      sharedPreferences.setString('token_type', token.token_type);
      sharedPreferences.setInt('expires_in', token.expires_in);
      sharedPreferences.setString('access_token', token.access_token);
      sharedPreferences.setBool('is_authenticated', true);

      return true;

    });
  }

}
