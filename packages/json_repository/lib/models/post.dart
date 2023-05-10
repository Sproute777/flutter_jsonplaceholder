import 'package:database_client/database_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int id;
  final int userId;
  final String title;

  Post({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  // /// using in [drift] , save class to local storage
  // PostCompanion toPostCompanion(int userId) => PostCompanion(
  //       userId: Value(userId),
  //       id: Value(this.id),
  //       title: Value(this.title),
  //     );
  //
  // /// using in [drift] , convert entry to user class
  // factory Post.fromEntry(PostEntry entry) {
  //   return Post(
  //     id: entry.id,
  //     userId: entry.userId ?? -1,
  //     title: entry.title,
  //   );
  // }

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
      ];
}

// {
// "userId": 1,
// "id": 1,
// "title": "quidem molestiae enim"
// },
