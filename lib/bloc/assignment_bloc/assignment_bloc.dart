import 'dart:async';
import 'package:staffer/repositories/assignment_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'assignment.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  AssignmentRepository repository;

  AssignmentBloc({@required this.repository});

  @override
  AssignmentState get initialState => AssignmentInitialState();

  @override
  Stream<AssignmentState> mapEventToState(AssignmentEvent event) async* {
    print('hehehehe');
    // if (event is FetchAssignmentEvent) {
    //   yield AssignmentLoadingState();
    //   try {
    //     List<Assignment> assignments = await repository.getAssignments();
    //     yield AssignmentLoadedState(assignments: assignments);
    //   } catch (e) {
    //     yield AssignmentErrorState(message: e.toString());
    //   }
    // }
  }
}
