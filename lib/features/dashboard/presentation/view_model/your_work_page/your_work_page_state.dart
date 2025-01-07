import 'package:equatable/equatable.dart';

abstract class WorkState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WorkInitial extends WorkState {}

class WorkLoading extends WorkState {}

class WorkLoaded extends WorkState {
  final List<Map<String, dynamic>> works;

  WorkLoaded(this.works);

  @override
  List<Object?> get props => [works];
}

class WorkError extends WorkState {
  final String errorMessage;

  WorkError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
