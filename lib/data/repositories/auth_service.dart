

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/main.dart';

class AuthService{

  /* ------------------------------ Email and Password sign in ---------------------------------------*/

  /// [EmailAuthentication] - Sign In
  Future<AuthResponse> signInWithEmailPassword(String email, String password) async {
    return await supabase.auth.signInWithPassword(email:email, password: password);

  }

  /// [EmailAuthentication] - Sign up
  Future<AuthResponse> signUpWithEmailPassword(String email, String password) async {
    return await supabase.auth.signUp(email:email, password: password);
  }

  /// [EmailAuthentication] - Sign out
  Future<void> signOut() async {
    return await supabase.auth.signOut();
  }

  /// [EmailAuthentication] - Get User email
  String? getCurrentUserEmail(){
    final session = supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

/// [EmailAuthentication] - FORGET PASSWORD

/// [EmailVerification] - MAIL VERIFICATION

/// [EmailVerification] - RE AUTHENTICATE USER


  /* ---------------------------------------- ./end Federated identity & social sign in ------------------------------------ */


  /// DELETE USER - Remove user Auth and Supabase Account
  Future<void> deleteAccount() async {

  }

}