import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/config/app_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

Future<void> signUp({String email, String pass, String name}) async {
  try {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );

    await FirebaseFirestore.instance
        .collection(AppString.UsersNames)
        .doc(userCredential.user.uid)
        .set({"name": name});
  } on Exception catch (e) {
    throw e;
  }
}

Future<void> signIn({String email, String pass}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
  } on Exception catch (e) {
    throw e;
  }
}

Future<void> googleSignIn() async {
  final googleSignIn = GoogleSignIn();
  final googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final googleSignInAuth = await googleSignInAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuth.idToken,
      accessToken: googleSignInAuth.accessToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

Future<void> facebookSignin() async {
  final facebookSignIn = FacebookLogin();
  try {
    final result = await facebookSignIn.logIn(['email']);
    
    final token = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(token);
      await FirebaseAuth.instance.signInWithCredential(credential);
    
      // final graphResponse = await http.get(
      //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}');
    }
  } on Exception catch (e) {
    // TODO
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  final facebookSignIn = FacebookLogin();
  if (await facebookSignIn.isLoggedIn) {
    await facebookSignIn.logOut();
  } else {
    try {
      await GoogleSignIn().disconnect();
    } catch (_) {}
  }
}
