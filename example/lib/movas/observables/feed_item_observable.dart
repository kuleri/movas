import 'dart:convert';

class FeedItemO {
  FeedItemO({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;

  FeedItemO copyWith({
    int id,
    int userId,
    String title,
    String body,
  }) {
    return FeedItemO(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory FeedItemO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FeedItemO(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItemO.fromJson(String source) =>
      FeedItemO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeedItemO(id: $id, userId: $userId, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedItemO &&
        o.id == id &&
        o.userId == userId &&
        o.title == title &&
        o.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
