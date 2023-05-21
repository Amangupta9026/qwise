import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/file_collection.dart';

void onTapGoogle(context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  if (auth.currentUser != null) {
    GoRouter.of(context).pushReplacementNamed(RouteNames.main);
  } else {
    await googleSignIn.signIn();
    final GoogleSignInAccount? googleUser = googleSignIn.currentUser;
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        GoRouter.of(context).pushReplacementNamed(RouteNames.main);
      }
    }
  }
}
