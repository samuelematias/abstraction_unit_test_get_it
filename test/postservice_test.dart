import 'package:abstraction_unit_test_get_it/services/post_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostService Test | ', () {
    test('Constructing Service should find correct dependencies', () {
      var postService = PostService();
      expect(postService != null, true);
    });
  });
}
