import 'dart:async';
import 'package:uniquest/utils/popups/loader.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';


/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {

      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check the internet connection status.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (e) {
      print('Connectivity check failed: ${e.message}');
      return false;
    }
  }
  // Future<bool> isConnected() async {
  //   try {
  //     final result = await _connectivity.checkConnectivity();
  //     if (result == ConnectivityResult.none) {
  //       print('objecet');
  //       return false;
  //     } else {
  //       print('objecdt');
  //       return true;
  //     }
  //   } on PlatformException catch (_) {
  //     print('object');
  //     return false;
  //   }
  // }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
