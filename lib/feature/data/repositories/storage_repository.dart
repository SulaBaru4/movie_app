/// Repository interface for working with Supabase storage
///
/// Showing the method for getting URL of image
abstract class StorageRepository {
  /// gets list of image's URL from bucket
  Future<List<String>> fetchImageUrls (String bucketName);
}