import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/models/new_movies_model/movie.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: movie?.largeCoverImage ?? '',
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
        ),
        child: const Icon(Icons.error, color: AppColors.red),
      ),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider, 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
