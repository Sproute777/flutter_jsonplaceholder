import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(createToJson: false)
class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [id, name, username, email, phone, website];
}

// {
// "id": 1,
// "name": "Leanne Graham",
// "username": "Bret",
// "email": "Sincere@april.biz",
// "address": {
// "street": "Kulas Light",
// "suite": "Apt. 556",
// "city": "Gwenborough",
// "zipcode": "92998-3874",
// "geo": {
// "lat": "-37.3159",
// "lng": "81.1496"
// }
// },
// "phone": "1-770-736-8031 x56442",
// "website": "hildegard.org",
// "company": {
// "name": "Romaguera-Crona",
// "catchPhrase": "Multi-layered client-server neural-net",
// "bs": "harness real-time e-markets"
// }
// },
