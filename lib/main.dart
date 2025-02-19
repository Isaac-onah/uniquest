import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/bindings/general_bindings.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/utils/constants/api_constants.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/theme/theme.dart';

Future<void> main() async {
  ///Widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding
      .ensureInitialized();

  Gemini.init(apiKey: GEMINI_API_KEY);


  ///Getx local storage
  await GetStorage.init();

  /// Preserve splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///initialize supabase
  await Supabase.initialize(url: "https://icfddygqzfpfurhqyexd.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImljZmRkeWdxemZwZnVyaHF5ZXhkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk4ODE0NzEsImV4cCI6MjA1NTQ1NzQ3MX0.SuACogQExjgSfzDx3XbGMHHAEcHD-UEdpmgp6TFaefw");

  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: TColors.primary,)
        ),
      ),
    );
  }
}