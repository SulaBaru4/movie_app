import 'package:application_pet/feature/domain/usecases/fetch_images_usecase.dart';
import 'package:flutter/cupertino.dart';

/// ViewModel for managing list of images
///
/// Works with FetchImagesUseCase for getting data and update state of UI

class ImagesViewModel extends ChangeNotifier {
  final FetchImageUseCase fetchImageUseCase;

  List<String> _images = [];
  List<String> get images => _images;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

/// Constructor getting use-case to work with data
  ImagesViewModel(this.fetchImageUseCase);

/// loads images from bucket
  Future<void> fetchImages(String bucketName) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _images = await fetchImageUseCase(bucketName);
    } catch (e) {
      _errorMessage = "Error while loading image: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  }