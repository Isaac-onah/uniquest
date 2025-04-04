import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/data/model/university.dart';

class UniversityController extends GetxController {
  static UniversityController get instance => Get.find();


  final SupabaseClient _supabase = Supabase.instance.client;
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
      isLoading(true);

      // Clear previous data
      universities.clear();

      // Fetch data with proper typing
      final response = await _supabase
          .from('universities')
          .select('*')
          .order('name', ascending: true);  // Optional: add ordering

      // Check if response is valid
      if (response != null && response is List) {
        universities.assignAll(
          response.map((uni) => University.fromJson(uni)).toList(),
        );
      } else {
        throw Exception('Invalid response format');
      }

    } on PostgrestException catch (e) {
      Get.snackbar('Database Error', 'Failed to load universities: ${e.message}');
      print('Supabase error: ${e.message}');
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
      print('Unexpected error: $e');
    } finally {
      isLoading(false);
    }
  }

}
