import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:road_to_news/authentication/auth_service.dart';

class AuthBlocGoogle {
  final AuthService _authService = AuthService();
  final googleSignin = GoogleSignIn(scopes: ['email']);

  Stream<User> get currentUser => _authService.currentUser;

  Future<User> loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      final result = await _authService.signInWithCredential(credential);
      print('${result.user.displayName} is logged in.');
      return result.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  logout() {
    _authService.logout();
    googleSignin.disconnect();
  }
}
