import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit <AuthStates> {
  AuthCubit() : super(AuthInitialState());


// Google Auth
  Future<Object> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // This Method is For Logging Out.
    if (googleUser == null) {
      emit(GoogleAuthLoggedOUT());
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
          value) async {
        emit(GoogleAuthSuccess());
      }),

    };
  }


//
// User(displayName: Alaa Khalaf, email: alaakhalaf696@gmail.com, isEmailVerified: true, isAnonymous: false, metadata:
// UserMetadata(creationTime: 2024-03-17 11:00:52.863Z, lastSignInTime: 2024-03-18 09:43:06.077Z),
// phoneNumber: null
// , providerData, [UserInfo(displayName: Alaa Khalaf, email: alaakhalaf696@gmail.com,
// phoneNumber: null,
// providerId: google.com, uid: 100695708394702904861)7046pZWyEgSquSRX1nf00R7aASW2)


//
//
// }],
// refreshToken: null, tenantId: null, uid:


}
