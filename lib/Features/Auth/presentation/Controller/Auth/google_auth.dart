
import 'package:fatem_users/Features/Auth/Data/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../AuthLocal/auth_cache_network.dart';

Future<Object> signInWithGoogle() async {
 // emit(GoogleAuthLoading());
  // Trigger the authentication flow

  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // This Method is For Logging Out.
  if (googleUser == null) {
  //  emit(GoogleAuthLoggedOUT());
    return "";
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return {
    await FirebaseAuth.instance.signInWithCredential(credential).then((
        value)  {
      CacheNetwork.insertStrings(
          key: "token", value: value.user!.uid);
        UserModel.cacheData(
        nameF: value.user!.displayName,
        emailF: value.user!.email,
        phoneNumberF: value.user!.phoneNumber,
        avatarPathF: value.user!.photoURL
      );

        //print(value.user!.displayName);
      //emit(GoogleAuthSuccess());
    }),
  };
}

