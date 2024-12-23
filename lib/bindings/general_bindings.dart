import 'package:uniquest/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }

}