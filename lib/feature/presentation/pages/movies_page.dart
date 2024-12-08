import 'package:application_pet/common/colors.dart';
import 'package:application_pet/common/common_space.dart';
import 'package:application_pet/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../common/widget_size.dart';
import '../../domain/entities/movie.dart';

/// Displays detailed information about a movie, including its description and trailer.
///
/// This page provides a comprehensive view of a movie, including an image, a description,
/// and an embedded YouTube player for the movie trailer.
class MoviesPage extends StatefulWidget {
  final Movie movie;

  const MoviesPage({super.key, required this.movie});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    /// Extracts the video ID from the YouTube URL and initializes the controller.
    final videoId = YoutubePlayerController.convertUrlToId(widget.movie.videoLink);
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId ?? "",
      autoPlay: false,
      params: YoutubePlayerParams(
        mute: false,
        showFullscreenButton: true,
        showControls: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widgetSize = WidgetSize(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.cleanWhite),
        backgroundColor: AppColors.pink,
        title: Text(
          softWrap: true,
          widget.movie.title,
          style: TextStyle(fontSize: 32, color: AppColors.cleanWhite),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            widgetSpace(20),
            Align(
                alignment: Alignment.topCenter,
                /// Displays the movie's image.
                child: Image.asset(
                  widget.movie.imageAsset,
                  width: widgetSize.width * 0.45,
                  height: widgetSize.height * 0.41,
                  fit: BoxFit.cover,
                )),
            widgetSpace(20),

            CustomText(
                text: "Description",
                firstLetterColor: AppColors.pink,
                remainingTextColor: Colors.black),
            widgetSpace(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.movie.description),
            ),
            widgetSpace(20),
            CustomText(
                text: "Trailer",
                firstLetterColor: AppColors.pink,
                remainingTextColor: Colors.black),
            widgetSpace(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: YoutubePlayer(
                aspectRatio: 16/9,
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
