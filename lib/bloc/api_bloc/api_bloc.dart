import 'dart:async';

import 'package:staffer/repositories/api.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final Api api;

  ApiBloc({
    @required this.api,
  }) : assert(api != null);

  @override
  ApiState get initialState => ApiInitial();
  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    if (event is FetchData) {
      yield ApiLoading();
      try {
        var url = '';
        final data = await api.getData(url);
        yield ApiInitial();
      } catch (error) {
        yield ApiFailure(error: error.toString());
      }
    }
  }
}
