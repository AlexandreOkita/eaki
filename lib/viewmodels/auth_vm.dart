import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authVM = Provider.autoDispose(
  (ref) => AuthVM(),
);

class AuthVM {
  Future<UserCredential> anonymousLogin() async {
    return await FirebaseAuth.instance.signInAnonymously();
  }
}
