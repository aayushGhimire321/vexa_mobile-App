import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class ToggleTheme extends SettingsEvent {
  final bool isDarkMode;

  ToggleTheme(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}

class ToggleNotifications extends SettingsEvent {
  final bool isEnabled;

  ToggleNotifications(this.isEnabled);

  @override
  List<Object?> get props => [isEnabled];
}
