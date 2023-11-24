import 'package:dio/dio.dart';

class ProductService {
  static const String apiUrl = 'https://api.escuelajs.co/api/v1/products';

  static Future fetchProducts() async {
    try {
      final response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        // Status code is 200, return the response data
        return response.data;
      } else {
        // Status code is different, print an error message and return null
        return null;
      }
    } catch (e) {
      // Exception occurred, print an error message and return null

      return e;
    }
  }
}
