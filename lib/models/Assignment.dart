import 'package:equatable/equatable.dart';
import 'dart:ffi';
class Assignment {
  final int jobId;
  final String startDate;
  final String endDate;

  const Assignment({
     required this.jobId,
     required this.startDate,
     required this.endDate,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      jobId: json['job_id'] as int,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );
  }
}

// class Assignment extends Equatable {
//   final id;
//   final String quoteText;
//   final String quoteAuthor;

//   const Assignment({this.id, this.quoteText, this.quoteAuthor});

//   @override
//   List<Object> get props => [id, quoteText, quoteAuthor];

//   static Assignment fromJson(dynamic json) {
//     print(json['_id']);
//     print('------model-----');

//     return Assignment(
//       id: json['_id'],
//       quoteText: json['quoteText'],
//       quoteAuthor: json['quoteAuthor'],
//     );
//   }

//   @override
//   String toString() => 'Quote { id: $id }';
// }

