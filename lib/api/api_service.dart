import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activity.dart';

class ApiService {
  static const String _baseUrl = 'https://bored.api.lewagon.com/api/';

  static Future<Activity?> getActivity() async {
    try {
      final res = await http.get(Uri.parse('${_baseUrl}activity/'));
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        return Activity.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
