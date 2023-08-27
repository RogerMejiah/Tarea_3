class Credits {
  List<Credits> credits = [];
  String name;

  Credits({
    required this.name,
  });

  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      name: json['name'],
    );
  }
}
