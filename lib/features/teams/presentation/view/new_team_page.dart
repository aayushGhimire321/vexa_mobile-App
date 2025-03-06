import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/app/constants/strings.dart';

import '../view_model/new_team_page_bloc.dart';
import '../view_model/new_team_page_event.dart';
import '../view_model/new_team_page_state.dart';

class TeamsScreen extends StatelessWidget {
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController teamDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeamsBloc()..add(LoadTeams()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.teamsTitle),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if (state is TeamsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TeamsLoaded) {
                    if (state.teams.isEmpty) {
                      return Center(child: Text(AppStrings.noTeamsMessage));
                    }
                    return ListView.builder(
                      itemCount: state.teams.length,
                      itemBuilder: (context, index) {
                        final team = state.teams[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(team.name),
                            subtitle: Text(team.description),
                          ),
                        );
                      },
                    );
                  } else if (state is TeamsError) {
                    return Center(child: Text(state.errorMessage));
                  }

                  return Center(child: Text(AppStrings.genericErrorMessage));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: teamNameController,
                    decoration: InputDecoration(
                      labelText: AppStrings.teamNameLabel,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: teamDescriptionController,
                    decoration: InputDecoration(
                      labelText: AppStrings.teamDescriptionLabel,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (teamNameController.text.isNotEmpty &&
                          teamDescriptionController.text.isNotEmpty) {
                        context.read<TeamsBloc>().add(
                          CreateTeam(
                            teamName: teamNameController.text,
                            description: teamDescriptionController.text,
                          ),
                        );
                        teamNameController.clear();
                        teamDescriptionController.clear();
                      }
                    },
                    child: Text(AppStrings.createTeamButton),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
