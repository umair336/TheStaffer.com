part of 'assignment_bloc.dart';

abstract class AssignmentState extends Equatable {}

class AssignmentInitialState extends AssignmentState {
  @override
  List<Object> get props => [];
}

class AssignmentLoadingState extends AssignmentState {
  @override
  List<Object> get props => [];
}

class AssignmentLoadedState extends AssignmentState {

  List<Assignment> assignments;

  AssignmentLoadedState({@required this.assignments});

  @override
  List<Object> get props => [assignments];
}

class AssignmentErrorState extends AssignmentState {

  String message;

  AssignmentErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}