import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/storage_repository.dart';

/// Repository to work with Supabase storage
///
/// This class provides methods for getting URLs of images from bucket
class StorageRepositoryImpl implements StorageRepository{
  final SupabaseClient supabaseClient;

  /// Constructor, requires Supabase client
  StorageRepositoryImpl(this.supabaseClient);

  @override
  Future <List<String>> fetchImageUrls(String bucketName) async {
    try {
      /// getting list of files from bucket
      final response = await supabaseClient
          .storage
          .from(bucketName)
          .list();
      if (response.isEmpty) {
        throw Exception("No files found in bucket");
      }
      /// generating public URL's for all files
      final urls = response.map((file){
       return supabaseClient.storage.from(bucketName).getPublicUrl(file.name);
      }).toList();

      return urls;
    } catch (e) {
      throw Exception('Error while getting images: $e');
    }
  }
}