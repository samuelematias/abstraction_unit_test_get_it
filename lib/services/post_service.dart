import 'package:abstraction_unit_test_get_it/locator.dart';
import 'package:abstraction_unit_test_get_it/services/storage/storage_service.dart';

import 'api/api.dart';

class PostService {
  Api _api = locator<Api>();
  StorageService _storageService = locator<StorageService>();

  Future<bool> likePost(int postId) async {
    var localLikeSuccess = await _storageService.likePost(postId);
    var postLiked = await _api.likePost(postId);

    if (postLiked) {
      return true;
    }

    // TODO: Revert the local like
    if (localLikeSuccess) {
      await _storageService.likePost(postId, unlike: true);
    }

    return false;
  }
}
