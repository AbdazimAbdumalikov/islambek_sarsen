class User {
  final String username;
  final String email;
  final String image;

  const User({
    required this.username,
    required this.email,
    required this.image,
  });

  static User fromJson(json) => User(
    username: json['username'],
    email: json['email'],
    image: json['image'],
  );
}