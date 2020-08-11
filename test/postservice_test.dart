import 'package:abstraction_unit_test_get_it/locator.dart';
import 'package:abstraction_unit_test_get_it/services/localstorage_service.dart';
import 'package:abstraction_unit_test_get_it/services/post_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostService Test | ', () {
    setUpAll(() {
      setupLocator();
    });

    test('Constructing Service should find correct dependencies', () {
      var postService = PostService();
      expect(postService != null, true);
    });

    test('Given postId 1, should call localStorageService with 1', () async {
      var localStorageService = LocalStorageService();
      locator.registerSingleton(localStorageService);

      var postService = PostService();
      await postService.likePost(1);
      // expect(localStorageService);

      // We can't even check if the function was called!
      // expect(postService.likePost(1)) // ???
    });
  });
}
