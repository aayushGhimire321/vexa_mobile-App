import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/constants/strings.dart';
import '../../../../app/widget/action_button.dart';
import '../view_model/dashboard/dashboard_bloc.dart';
import '../view_model/dashboard/dashboard_event.dart';
import '../view_model/dashboard/dashboard_state.dart'; // Import strings

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(LoadDashboardData()),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            AppStrings.dashboardTitle, // Use string constant
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Sidebar(
          onItemSelected: (page) {
            // Handle sidebar selection
          },
          selectedItem: AppStrings.dashboardTitle, // Use string constant
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<DashboardBloc, DashboardState>(
            listener: (context, state) {
              if (state is DashboardError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is DashboardLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DashboardLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stat Cards Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatCard(
                          title: AppStrings.totalProjectsTitle, // Use string constant
                          value: "${state.totalProjects}",
                          subtitle: AppStrings.totalProjectsSubtitle, // Use string constant
                        ),
                        StatCard(
                          title: AppStrings.totalTasksTitle, // Use string constant
                          value: "${state.totalTasks}",
                          subtitle: AppStrings.totalTasksSubtitle, // Use string constant
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionButton(
                          title: AppStrings.createNewProject, // Use string constant
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            context.read<DashboardBloc>().add(CreateNewProject());
                          },
                        ),
                        ActionButton(
                          title: AppStrings.createNewTeam, // Use string constant
                          color: Colors.amber,
                          onPressed: () {
                            context.read<DashboardBloc>().add(CreateNewTeam());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Recent Projects Section
                    Text(
                      AppStrings.recentProjectsTitle, // Use string constant
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          state.recentProjectsMessage, // Use state value
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text("Something went wrong."));
              }
            },
          ),
        ),
      ),
    );
  }
}
