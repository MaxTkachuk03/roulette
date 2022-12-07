class Users {
  Users({
    this.uid,
    required this.name,
    required this.chips,
    required this.rating,
  });

  static Users fromJson(Map<String, dynamic> json) {
    return Users(
      uid: json['id'],
      name: json['name'],
      chips: json['chips'],
      rating: json['rating'],
    );
  }

  String? uid;
  final String name;
  final int chips;
  final int rating;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'chips': chips,
      'rating': rating,
    };
  }
}
