import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/app/constants/strings.dart';

import '../view_model/settings_bloc.dart';
import '../view_model/settings_event.dart';
import '../view_model/settings_state.dart'; // Use your AppStrings


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc()..add(LoadSettings()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.settingsTitle),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SettingsLoaded) {
              return ListView(
                children: [
                  // Theme Toggle
                  SwitchListTile(
                    title: Text(AppStrings.darkMode),
                    value: state.isDarkMode,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(ToggleTheme(value));
                    },
                  ),
                  Divider(),
                  // Notifications Toggle
                  SwitchListTile(
                    title: Text(AppStrings.notifications),
                    value: state.notificationsEnabled,
                    onChanged: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(ToggleNotifications(value));
                    },
                  ),
                  Divider(),
                  // Profile Option
                  ListTile(
                    title: Text(AppStrings.profile),
                    leading: Icon(Icons.person),
                    onTap: () {
                      // Navigate to Profile Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(), // Create a ProfileScreen
                        ),
                      );
                    },
                  ),
                  Divider(),
                  // About Option
                  ListTile(
                    title: Text(AppStrings.about),
                    leading: Icon(Icons.info),
                    onTap: () {
                      // Show About Dialog
                      showAboutDialog(
                        context: context,
                        applicationName: AppStrings.appName,
                        applicationVersion: "1.0.0",
                        applicationIcon: Icon(Icons.app_settings_alt),
                        children: [
                          Text(AppStrings.aboutDescription),
                        ],
                      );
                    },
                  ),
                ],
              );
            } else if (state is SettingsError) {
              return Center(child: Text(state.errorMessage));
            }
            return Center(child: Text(AppStrings.genericErrorMessage));
          },
        ),
      ),
    );
  }
}
