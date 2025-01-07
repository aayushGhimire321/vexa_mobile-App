import 'package:bloc/bloc.dart';
import 'package:vexa/app/constants/strings.dart'; // Ensure this import points to your `AppStrings`
import 'package:vexa/features/dashboard/presentation/view_model/project_page/project_page_event.dart';
import 'package:vexa/features/dashboard/presentation/view_model/project_page/project_page_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  List<Map<String, dynamic>> projects = []; // Mock database for projects

  ProjectBloc() : super(ProjectInitial()) {
    on<LoadProjects>(_onLoadProjects);
    on<CreateProject>(_onCreateProject);
  }

  Future<void> _onLoadProjects(
      LoadProjects event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    try {
      // Simulate loading delay
      await Future.delayed(Duration(seconds: 2));
      if (projects.isEmpty) {
        emit(ProjectLoaded([]));
      } else {
        emit(ProjectLoaded(projects));
      }
    } catch (e) {
      emit(ProjectError(AppStrings.failedToLoadData));
    }
  }

  Future<void> _onCreateProject(
      CreateProject event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    try {
      // Add the new project to the list
      projects.add({
        'title': event.title,
        'description': event.description,
        'tags': event.tags,
      });
      emit(ProjectLoaded(projects));
    } catch (e) {
      emit(ProjectError(AppStrings.genericErrorMessage));
    }
  }
}
