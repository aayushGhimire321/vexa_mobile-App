import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final bool isDarkMode;
  final bool notificationsEnabled;

  SettingsLoaded({
    required this.isDarkMode,
    required this.notificationsEnabled,
  });

  @override
  List<Object?> get props => [isDarkMode, notificationsEnabled];
}

class SettingsError extends SettingsState {
  final String errorMessage;

  SettingsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
