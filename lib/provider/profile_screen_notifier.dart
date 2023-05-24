import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwise/utils/file_collection.dart';

class ProfileScreenNotifier extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;

  void logout(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.signOut();
      await signInLoginData(email);
    } catch (e) {
      //
    }
    // ignore: use_build_context_synchronously
    context.pushNamed(RouteNames.signInScreen);
  }

  // send userLogout value in firebase
  Future <void> signInLoginData(String email) async {
    await firestore.collection('signup').doc(email).update({
      'servertime': FieldValue.serverTimestamp(),
      'isUserLogedIn': false,
    });
  }
}
