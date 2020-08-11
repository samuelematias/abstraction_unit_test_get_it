import 'package:abstraction_unit_test_get_it/locator.dart';
import 'package:abstraction_unit_test_get_it/services/api/api.dart';
import 'package:abstraction_unit_test_get_it/services/post_service.dart';
import 'package:abstraction_unit_test_get_it/services/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStorageService extends Mock implements StorageService {}

class MockApi extends Mock implements Api {}

void main() {
  group('PostService Test | ', () {
    setUpAll(() {
      setupLocator();
      locator.allowReassignment = true;
    });

    test('Constructing Service should find correct dependencies', () {
      var postService = PostService();
      expect(postService != null, true);
    });

    // After implementing the abstract class (interface)
    test('Given postId 1, should call localStorageService with 1', () async {
      var mockStorageService = MockStorageService();
      locator.registerSingleton<StorageService>(mockStorageService);

      var mockApi = MockApi();
      // return fake subs
      when(mockApi.likePost(1)).thenAnswer((_) => Future.value(true));
      locator.registerSingleton<Api>(mockApi);

      var postService = PostService();
      await postService.likePost(1);
      verify(mockStorageService.likePost(1));
    });

    // Before implementing the abstract class (interface)
    // test('Given postId 1, should call localStorageService with 1', () async {
    //   var localStorageService = LocalStorageService();
    //   locator.registerSingleton(localStorageService);

    //   var postService = PostService();
    //   await postService.likePost(1);
    //   // expect(localStorageService);

    //   // We can't even check if the function was called!
    //   // expect(postService.likePost(1)) // ???
    // });

    test('Given like fails, should rever localike', () async {
      var mockStorageService = MockStorageService();
      // Like was successful locally
      when(mockStorageService.likePost(1))
          .thenAnswer((_) => Future.value(true));
      locator.registerSingleton<StorageService>(mockStorageService);

      var mockApi = MockApi();
      // Like was successful locally
      when(mockApi.likePost(1)).thenAnswer((_) => Future.value(false));
      locator.registerSingleton<Api>(mockApi);

      var postService = PostService();
      await postService.likePost(1);
      // Confirm the sstorage like was called with unlike
      verify(mockStorageService.likePost(1, unlike: true));
    });
  });
}
