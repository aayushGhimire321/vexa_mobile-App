import 'package:bloc/bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;

  SettingsBloc() : super(SettingsInitial()) {
    on<LoadSettings>(_onLoadSettings);
    on<ToggleTheme>(_onToggleTheme);
    on<ToggleNotifications>(_onToggleNotifications);
  }

  void _onLoadSettings(LoadSettings event, Emitter<SettingsState> emit) {
    emit(SettingsLoading());
    // Simulate loading settings from a local database or API
    emit(SettingsLoaded(
      isDarkMode: isDarkMode,
      notificationsEnabled: notificationsEnabled,
    ));
  }

  void _onToggleTheme(ToggleTheme event, Emitter<SettingsState> emit) {
    isDarkMode = event.isDarkMode;
    emit(SettingsLoaded(
      isDarkMode: isDarkMode,
      notificationsEnabled: notificationsEnabled,
    ));
  }

  void _onToggleNotifications(
      ToggleNotifications event, Emitter<SettingsState> emit) {
    notificationsEnabled = event.isEnabled;
    emit(SettingsLoaded(
      isDarkMode: isDarkMode,
      notificationsEnabled: notificationsEnabled,
    ));
  }
}
