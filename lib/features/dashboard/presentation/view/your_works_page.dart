import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/app/constants/strings.dart';
import '../view_model/your_work_page/your_work_page_bloc.dart';
import '../view_model/your_work_page/your_work_page_event.dart';
import '../view_model/your_work_page/your_work_page_state.dart';


class WorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkBloc()..add(LoadWorks()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.dashboardTitle),
        ),
        body: BlocBuilder<WorkBloc, WorkState>(
          builder: (context, state) {
            if (state is WorkLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WorkLoaded) {
              if (state.works.isEmpty) {
                return Center(child: Text(AppStrings.noProjectsMessage));
              }
              return ListView.builder(
                itemCount: state.works.length,
                itemBuilder: (context, index) {
                  final work = state.works[index];
                  return ListTile(
                    title: Text(work['title']),
                    subtitle: Text(work['description']),
                    trailing: Wrap(
                      spacing: 8.0,
                      children: work['tags']
                          .map<Widget>((tag) => Chip(label: Text(tag)))
                          .toList(),
                    ),
                  );
                },
              );
            } else if (state is WorkError) {
              return Center(child: Text(state.errorMessage));
            }
            return Center(child: Text(AppStrings.noProjectsAvailable));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Example of creating a work
            context.read<WorkBloc>().add(CreateWork(
              title: "New Work",
              description: "Work description",
              tags: ["UI", "UX", "Design"],
            ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
