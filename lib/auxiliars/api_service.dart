import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final futureServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<String> getActivity() async {
    var url = Uri.https('www.boredapi.com', '/api/activity/');
    try {
      final response = await http.get(url);
      var info = jsonDecode(response.body);
      return (info['activity']);

      // print('RESPONSE IS ${response.body{'activity'}}');
    } catch (e) {
      return 'Error is $e';
    }
  }
}

final futureValueProvider = FutureProvider.autoDispose((ref) {
  final apiService = ref.watch(futureServiceProvider);
  return apiService.getActivity();
});
