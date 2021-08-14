import 'dart:async';
import 'package:staffer/repositories/assignment_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:staffer/models/models.dart';
import 'package:bloc/bloc.dart';
part 'assignment_event.dart';
part 'assignment_state.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {

  AssignmentRepository repository;

  AssignmentBloc({@required this.repository});

  @override
  AssignmentState get initialState => AssignmentInitialState();

  @override
  Stream<AssignmentState> mapEventToState(AssignmentEvent event) async* {
    if (event is FetchAssignmentEvent) {
      yield AssignmentLoadingState();
      try {
        List<Assignment> assignments = await repository.getAssignments();
        yield AssignmentLoadedState(assignments: assignments);
      } catch (e) {
        yield AssignmentErrorState(message: e.toString());
      }
    }
  }

}