// To parse this JSON data, do
//
//     final traviaModel = traviaModelFromJson(jsonString);

import 'dart:convert';

import 'package:funny_monster/features/domaine/entities/trivia_entity.dart';

TriviaModel triviaModelFromJson(String str) => TriviaModel.fromJson(json.decode(str));

String triviaModelToJson(TriviaModel data) => json.encode(data.toJson());

class TriviaModel extends Trivia {
  const TriviaModel({
    required super.msg,
  });

  factory TriviaModel.fromJson(Map<String, dynamic> json) => TriviaModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
