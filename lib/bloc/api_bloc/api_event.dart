part of 'api_bloc.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();
}



class FetchData extends ApiEvent {
  const FetchData();

  @override
  List<Object> get props => [];
}