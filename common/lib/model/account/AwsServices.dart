import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart';

class AwsServices {
  final userPool = CognitoUserPool(
    '${(dotenv.env['POOL_ID'])}',
    '${(dotenv.env['CLIENT_ID'])}',
  );

  Future<void> signUp(String email, String password) async {
    final userAttributes = [
      AttributeArg(name: 'phone_number', value: "+8201083131764"),
    ];

    var data;

    try {
      data = await userPool.signUp(email, password,
          userAttributes: userAttributes);
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    debugPrint('Authenticating User...');
    final cognitoUser = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);

      debugPrint('Login Success...');

    } on CognitoUserNewPasswordRequiredException catch (e) {
      debugPrint('CognitoUserNewPasswordRequiredException $e');
    } on CognitoUserMfaRequiredException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserSelectMfaTypeException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserMfaSetupException catch (e) {
      debugPrint('CognitoUserMfaSetupException $e');
    } on CognitoUserTotpRequiredException catch (e) {
      debugPrint('CognitoUserTotpRequiredException $e');
    } on CognitoUserCustomChallengeException catch (e) {
      debugPrint('CognitoUserCustomChallengeException $e');
    } on CognitoUserConfirmationNecessaryException catch (e) {
      debugPrint('CognitoUserConfirmationNecessaryException $e');
    } on CognitoClientException catch (e) {
      debugPrint('CognitoClientException $e');
    } catch (e) {
      print(e);
    }
  }

  String calculateSecretHash(
      String username, String clientId, String clientSecret) {
    final message = utf8.encode(username + clientId);
    final secret = utf8.encode(clientSecret);
    final hmacSha256 = Hmac(sha256, secret);
    final hash = hmacSha256.convert(message);
    final secretHash = base64Encode(hash.bytes);
    return secretHash;
  }
}
