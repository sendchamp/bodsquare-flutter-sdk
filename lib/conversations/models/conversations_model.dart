import 'dart:convert';

class ConversationsModel {
  int? id;
  String? email;
  String? username;
  String? imageUrl;
  List<Chats>? chats;
  String? platform;

  ConversationsModel(
      {this.id,
      this.email,
      this.username,
      this.imageUrl,
      this.chats,
      this.platform});

  ConversationsModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    imageUrl = json['imageUrl'];
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats?.add(Chats.fromJson(v));
      });
    }
    platform = json['platform'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['imageUrl'] = imageUrl;
    if (chats != null) {
      data['chats'] = chats?.map((v) => v.toJson()).toList();
    }
    data['platform'] = platform;
    return data;
  }

  @override
  String toString() {
    return 'ConversationsModel(id: $id, email: $email, username: $username, imageUrl: $imageUrl, chats: $chats, platform: $platform)';
  }
}

class Chats {
  Chats({
    this.date,
    this.message,
    this.read,
    this.owner,
  });

  DateTime? date;
  String? message;
  bool? read;
  String? owner;

  Chats copyWith({
    DateTime? date,
    String? message,
    bool? read,
    String? owner,
  }) {
    return Chats(
      date: date ?? this.date,
      message: message ?? this.message,
      read: read ?? this.read,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date?.millisecondsSinceEpoch,
      'message': message,
      'read': read,
      'owner': owner,
    };
  }

  factory Chats.fromMap(Map<String, dynamic> map) {
    return Chats(
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      message: map['message'],
      read: map['read'],
      owner: map['owner'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Chats.fromJson(String source) => Chats.fromMap(json.decode(source));

  @override
  String toString() =>
      'Chats(date: $date, message: $message, read: $read ,owner: $owner)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chats &&
        other.date == date &&
        other.message == message &&
        other.read == read &&
        other.owner == owner;
  }

  @override
  int get hashCode =>
      date.hashCode ^ message.hashCode ^ read.hashCode ^ owner.hashCode;
}
