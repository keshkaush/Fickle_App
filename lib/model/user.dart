import 'package:meta/meta.dart';
import 'package:fickle/utils/utils.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class ListOfUser {
  final String idUser;
  final String name;
  final String urlAvatar;
  final DateTime lastMessageTime;

  const ListOfUser({
    this.idUser,
    @required this.name,
    @required this.urlAvatar,
    @required this.lastMessageTime,
  });

  ListOfUser copyWith({
    String idUser,
    String name,
    String urlAvatar,
    String lastMessageTime,
  }) =>
      ListOfUser(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      );

  static ListOfUser fromJson(Map<String, dynamic> json) => ListOfUser(
    idUser: json['idUser'],
    name: json['name'],
    urlAvatar: json['urlAvatar'],
    lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
  );

  Map<String, dynamic> toJson() => {
    'idUser': idUser,
    'name': name,
    'urlAvatar': urlAvatar,
    'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
  };
}