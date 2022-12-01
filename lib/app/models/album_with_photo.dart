import 'package:equatable/equatable.dart';

import 'models.dart';

class AlbumWithPhotos extends Equatable {
  const AlbumWithPhotos({required this.album, this.photos = const <Photo>[]});
  final Album album;
  final List<Photo> photos;

  @override
  List<Object?> get props => [album, photos];
}
