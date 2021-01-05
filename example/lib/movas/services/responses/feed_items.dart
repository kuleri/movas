import 'dart:convert';

import 'package:flutter/foundation.dart';

class FeedItemsResponse {
  FeedItemsResponse({
    this.items,
  });

  final List<FeedItem> items;

  factory FeedItemsResponse.fromList(data) => FeedItemsResponse(
      items: (data as List).map((item) => FeedItem.fromMap(item)).toList());

  factory FeedItemsResponse.empty() => FeedItemsResponse(items: null);

  FeedItemsResponse copyWith({
    List<FeedItem> items,
  }) {
    return FeedItemsResponse(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FeedItemsResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FeedItemsResponse(
      items: List<FeedItem>.from(map['items']?.map((x) => FeedItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItemsResponse.fromJson(String source) =>
      FeedItemsResponse.fromMap(json.decode(source));

  @override
  String toString() => 'FeedItemsResponse(items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedItemsResponse && listEquals(o.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

class FeedItem {
  FeedItem({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;

  FeedItem copyWith({
    int id,
    int userId,
    String title,
    String body,
  }) {
    return FeedItem(
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

  factory FeedItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FeedItem(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItem.fromJson(String source) =>
      FeedItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeedItem(id: $id, userId: $userId, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedItem &&
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
