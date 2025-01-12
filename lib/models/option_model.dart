// This is how I work with models in my applications, using models reduces the
// probability of errors and enforces validation through type safety in data.

import 'dart:convert';

Option optionFromJson(String str) => Option.fromJson(json.decode(str));

String optionToJson(Option data) => json.encode(data.toJson());

class Option {
  String text;

  Option({
    required this.text,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
