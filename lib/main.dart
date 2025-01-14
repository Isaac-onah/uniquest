
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uniquest/bindings/general_bindings.dart';
import 'package:uniquest/screens/authentication/onboarding/splashscreen.dart';
import 'package:uniquest/utils/theme/theme.dart';

Future<void> main() async{
  /// Widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Getx local storage
  await GetStorage.init();

  // /// Preserve splash until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home:  MySplashScreen(),

      // const Scaffold(
      //   backgroundColor: TColors.primary,
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TAnimationLoaderWidget(text: '', animation: TImages.decorAnimation)
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}