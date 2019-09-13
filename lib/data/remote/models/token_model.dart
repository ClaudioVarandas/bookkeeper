
class Token {
  String token_type;
  int expires_in;
  String access_token;

  Token({this.token_type,this.expires_in,this.access_token});

  Token.fromJson(Map<String, dynamic> json)
      : token_type = json['token_type'],
        expires_in = json['expires_in'],
        access_token = json['access_token'];

  Map<String, dynamic> toJson() =>
      {
        'token_type': token_type,
        'expires_in': expires_in,
        'access_token' : access_token
      };


}