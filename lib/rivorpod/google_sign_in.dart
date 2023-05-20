
import '../utils/file_collection.dart';

void onTapGoogle(context) async {
  if (auth.currentUser != null) {
    GoRouter.of(context).push(RouteNames.main);
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
        UserModel? user;
        try {
          user = await UsersRepository.createUser(
            userName: googleUser.email.split("@")[0],
            email: googleUser.email,
            fullName: googleUser.displayName ?? "",
            photoUrl: googleUser.photoUrl ?? "",
            mobileNumber: "",
          );
        } catch (e) {
          user = await UsersRepository.getUserByEmail(googleUser.email);
        } finally {
          if (user?.email != null && user!.email!.isNotEmpty) {
            GoRouter.of(context).push(RouteNames.mainScreen);
          }
        }
      }
    }
  }
}
