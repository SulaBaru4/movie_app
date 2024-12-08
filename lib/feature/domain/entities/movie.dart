/// A model representing a movie with its details.
/// Creates a [Movie] instance with the provided details.
///
/// - [title]: The title of the movie.
/// - [imageAsset]: The path to the image asset for the movie's poster.
/// - [description]: A short description of the movie.
/// - [videoLink]: A YouTube video link for the movie.
class Movie {
  final String title;
  final String imageAsset;
  final String description;
  final String videoLink;

  Movie({required this.title, required this.imageAsset, required this.description, required this.videoLink});
}