import 'package:equatable/equatable.dart';

class Assignment extends Equatable {
  final id;
  final String assignmentText;
  final String assignmentAuthor;

  const Assignment({this.id, this.assignmentText, this.assignmentAuthor});

  @override
  List<Object> get props => [id, assignmentText, assignmentAuthor];

  static Assignment fromJson(dynamic json) {
    return Assignment(
      id: 1,
      // assignmentText: json['assignmentText'],
      // assignmentAuthor: json['assignmentAuthor'],
    );
  }
  

  @override
  String toString() => 'Assignment { id: $id }';
}


