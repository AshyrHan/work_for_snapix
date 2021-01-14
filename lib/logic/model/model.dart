import 'package:flutter/material.dart';

class Notes {
  final String text;

  Notes({@required this.text});

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      text: json['text'],
    );
  }
  Map<String, dynamic> toJson() => {
        'text': text,
      };
}
