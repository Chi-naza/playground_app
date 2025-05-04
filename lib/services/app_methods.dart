import 'package:get/get_connect.dart';
import 'package:playground_app/model/pictures_model.dart';

class AppMethods {
  double divideTwoNumbers(int dividend, int divisor) {
    if (divisor == 0) return 0;

    double result = dividend / divisor;
    return result;
  }

  Future<PicturesModel> fetchPhotos(GetConnect connector) async {
    var response = await connector.get(
      "https://jsonplaceholder.typicode.com/album/1",
    );

    var body = response.body;

    if (response.statusCode == 200) {
      print("RESPONSE: $body");
      return PicturesModel.fromJson(body);
    } else {
      throw Exception("Failed to get pictures");
    }
  }
}
