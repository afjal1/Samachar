import 'package:firebase_auth/firebase_auth.dart';
import 'package:road_to_news/authentication/auth_service.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class AuthBlocFacebook {
  final authService = AuthService();
  final fb = FacebookLogin();

  Stream<User> get currentUser => authService.currentUser;

  Future<User> loginFacebook() async {
    print("Logging in with Facebook");

    final FacebookLoginResult res = await fb.logIn(permissions: [
      FacebookPermission.email,
      FacebookPermission.publicProfile
    ]);

    print(res.status);

    switch (res.status) {
      case FacebookLoginStatus.success:
        print("Login Successful");

        //Get Token
        final FacebookAccessToken fbToken = res.accessToken;

        //Convert to Auth Credential
        final AuthCredential credential =
            FacebookAuthProvider.credential(fbToken.token);
        print(fbToken.token);

        final result = await authService.signInWithCredential(credential);
        print('${result.user.displayName} is now logged in.');
        return result.user;
        break;
      case FacebookLoginStatus.cancel:
        print("The user cancelled the login");
        return null;
        break;
      case FacebookLoginStatus.error:
        print("There was an error");
        return null;
        break;
      default:
        return null;
    }
  }

  logout() {
    authService.logout();
    fb.logOut();
  }
}
