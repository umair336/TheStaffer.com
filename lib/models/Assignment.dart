import 'package:equatable/equatable.dart';

class Assignment extends Equatable {
  final id;
  final String quoteText;
  final String quoteAuthor;

  const Assignment({this.id, this.quoteText, this.quoteAuthor});

  @override
  List<Object> get props => [id, quoteText, quoteAuthor];

  static Assignment fromJson(dynamic json) {
    print(json['_id']);
    print('------model-----');

    return Assignment(
      id: json['_id'],
      quoteText: json['quoteText'],
      quoteAuthor: json['quoteAuthor'],
    );
  }

  @override
  String toString() => 'Quote { id: $id }';
}
