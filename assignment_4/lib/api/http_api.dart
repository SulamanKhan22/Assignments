import 'dart:convert';
import 'dart:typed_data'; // Import for Uint8List
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final DefaultCacheManager? cacheManager;

  ApiService(this.baseUrl, {this.cacheManager});

  Future<List<Map<String, dynamic>>> fetchUsersData() async {
    // Check if data is cached
    FileInfo? fileInfo = await cacheManager?.getFileFromCache('$baseUrl/api/v1/users');

    if (fileInfo != null && fileInfo.file != null) {
      // Data is available in cache, return cached data
      final cachedData = json.decode(fileInfo.file.readAsStringSync());
      return List<Map<String, dynamic>>.from(cachedData);
    } else {
      // Data is not in cache, make a network request
      final response = await http.get(Uri.parse('$baseUrl/api/v1/users'));

      if (response.statusCode == 200) {
        // Parse and use data
        final List<dynamic> jsonData = json.decode(response.body);

        // Convert List<int> to Uint8List before caching
        final Uint8List uint8ListData = Uint8List.fromList(utf8.encode(json.encode(jsonData)));

        // Cache the data
        cacheManager?.putFile('$baseUrl/api/v1/users', uint8ListData);

        return jsonData.cast<Map<String, dynamic>>();
      } else {
        // Handle error
        throw Exception('Failed to load users data');
      }
    }
  }
}
