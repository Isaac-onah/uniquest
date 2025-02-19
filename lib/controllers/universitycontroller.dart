import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/data/model/university.dart';

class UniversityController extends GetxController {
  static UniversityController get instance => Get.find();

  final supabase = Supabase.instance.client;
  var universities = <University>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchUniversities();
    super.onInit();
  }

  /// Fetch universities using Supabase RPC function
  Future<void> fetchUniversities() async {
    try {
      isLoading.value = true;

      final response = await supabase.rpc('fetch_universities');

      if (response != null && response is List && response.isNotEmpty) {
        print('Fetched universities: ${response}');
        universities.value = List<University>.from(
            response.map((university) => University.fromJson(university))
        );
      } else {
        Get.snackbar("Error", "No universities found");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
