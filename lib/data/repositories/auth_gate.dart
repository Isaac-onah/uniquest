
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/data/repositories/user_repository.dart';
import 'package:uniquest/screens/authentication/onboarding/splashscreen.dart';
import 'package:uniquest/screens/navigationscreens/navigation_menu.dart';
import 'package:uniquest/utils/constants/color.dart';



///---------------------------------------
///
/// AUTH GATE - This will continuously listen for auth state changes
///
/// --------------------------
/// Unauthenticated  -> LOGIN PAGE
/// Authenticated -> PROFILE PAGE
///
/// ----------------------------------------------



class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {

    final localStorage = GetStorage();
    final userRepository = Get.put(UserRepository());
    return StreamBuilder(
      ///Listen to auth state changes
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot){
          ///my loader
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(color: TColors.primary,),),
            );
          }

          ///check for valid session
          final session = snapshot.hasData ? snapshot.data!.session : null;


          if(session !=null){
            if(session.user.email !=null){
              localStorage.write('USER_EMAIL', session.user.email);
              userRepository.fetchUserDetails(session.user.email.toString());
              return NavigationMenu();
            } else {
              return MySplashScreen();
            }
          } else {
            return MySplashScreen();
          }
        });
  }
}
