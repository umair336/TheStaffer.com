import 'package:equatable/equatable.dart';

abstract class AssignmentEvent extends Equatable{}

class FetchAssignmentEvent extends AssignmentEvent {
  @override
  List<Object> get props => null;
}