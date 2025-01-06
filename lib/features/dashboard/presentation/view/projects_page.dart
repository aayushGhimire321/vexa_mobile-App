import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/app/constants/strings.dart';
import '../view_model/project_page/project_page_bloc.dart';
import '../view_model/project_page/project_page_event.dart';
import '../view_model/project_page/project_page_state.dart';


class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProjectBloc()..add(LoadProjects()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appTitle),
        ),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is ProjectLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProjectLoaded) {
              if (state.projects.isEmpty) {
                return Center(child: Text(AppStrings.noProjectsMessage));
              }
              return ListView.builder(
                itemCount: state.projects.length,
                itemBuilder: (context, index) {
                  final project = state.projects[index];
                  return ListTile(
                    title: Text(project['title']),
                    subtitle: Text(project['description']),
                  );
                },
              );
            } else if (state is ProjectError) {
              return Center(child: Text(state.errorMessage));
            }
            return Center(child: Text(AppStrings.noProjectsAvailable));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Example of creating a project
            context.read<ProjectBloc>().add(CreateProject(
              title: "New Project",
              description: "Project description",
              tags: ["Flutter", "Bloc"],
            ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
