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

  static Future<String?> fetchImageFromWikimedia(String query) async {
    final q = Uri.encodeComponent(query);
    final url = Uri.parse(
      'https://en.wikipedia.org/w/api.php?action=query&generator=search&gsrsearch=$q&gsrlimit=5&prop=pageimages&format=json&pithumbsize=600',
    );
    final res = await http.get(url);
    if (res.statusCode != 200) return null;
    final data = json.decode(res.body) as Map<String, dynamic>;
    final pages = (data['query']?['pages'] as Map?) ?? {};
    if (pages.isEmpty) return null;
    final first = pages.values.first as Map;
    return (first['thumbnail']?['source']) as String?;
  }
}
