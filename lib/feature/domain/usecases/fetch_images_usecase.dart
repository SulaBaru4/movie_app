import 'package:application_pet/feature/data/repositories/storage_repository.dart';

/// Usecase for getting URL of images from storage
///
/// Does the business logic for interrupt with StorageRepository

class FetchImageUseCase {
  final StorageRepository repository;

  /// Constructor, takes realisation of repository
  FetchImageUseCase(this.repository);


  /// getting images url
  Future<List<String>> call(String bucketName) async {
    return await repository.fetchImageUrls(bucketName);
  }
}