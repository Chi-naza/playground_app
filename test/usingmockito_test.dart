import 'package:flutter_test/flutter_test.dart';
import 'package:playground_app/model/pictures_model.dart';
import 'package:playground_app/services/app_methods.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get_connect.dart';

import 'usingmockito_test.mocks.dart';

@GenerateMocks([GetConnect])
void main() {
  final appMethods = AppMethods();

  // Evalaute code

  // Group test
  group("fetchPhotos", () {
    // Test case: success
    test("Case: Success - Successfully Fetched Pictures", () async {
      // Run: "dart run build_runner build" .... to generate mockFiles
      var mockConnector = MockGetConnect();

      when(
        mockConnector.get("https://jsonplaceholder.typicode.com/album/1"),
      ).thenAnswer(
        (_) async => Response(
          body: {'id': 'ueubdisiu', 'url': 'https://jpeg.com'},
          statusCode: 200,
        ),
      );

      expect(await appMethods.fetchPhotos(mockConnector), isA<PicturesModel>());
    });

    // Test case failure
    test("Case: Failure - Failed Fetched Pictures", () async {
      // Run: "dart run build_runner build" .... to generate mockFiles
      var mockConnector = MockGetConnect();

      when(
        mockConnector.get("https://jsonplaceholder.typicode.com/album/1"),
      ).thenAnswer(
        (_) async => Response(statusText: "Not found", statusCode: 404),
      );

      expect(appMethods.fetchPhotos(mockConnector), throwsException);
    });
  });
}
