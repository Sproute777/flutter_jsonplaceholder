part of 'album_cubit.dart';

enum AlbumStatus { initial, loading, error, success }

class AlbumState extends Equatable {
  const AlbumState._(
      {this.albums = const <AlbumWithPhotos>[],
      this.status = AlbumStatus.initial});
  final List<AlbumWithPhotos> albums;
  final AlbumStatus status;

  const AlbumState.initial() : this._();
  const AlbumState.loading() : this._(status: AlbumStatus.loading);
  const AlbumState.error() : this._(status: AlbumStatus.error);
  const AlbumState.success(List<AlbumWithPhotos> albums)
      : this._(albums: albums, status: AlbumStatus.success);

  @override
  List<Object> get props => [albums, status];
}
