import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'SocialLogin.dart';

class KakaoLogin implements SocialLogin {

  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          var oAuthToken = await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          var oAuthToken = await UserApi.instance.loginWithKakaoAccount();
          print(oAuthToken.accessToken);
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }

}