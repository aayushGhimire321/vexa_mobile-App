import 'package:bloc/bloc.dart';

import '../../../../../app/constants/strings.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart'; // Import strings

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
    on<CreateNewProject>(_onCreateNewProject);
    on<CreateNewTeam>(_onCreateNewTeam);
  }

  Future<void> _onLoadDashboardData(
      LoadDashboardData event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());
    try {
      // Mock loading dashboard data
      await Future.delayed(const Duration(seconds: 2)); // Simulate delay

      emit(DashboardLoaded(
        totalProjects: 0,
        totalTasks: 0,
        recentProjectsMessage: AppStrings.noProjectsAvailable, // Use string constant
      ));
    } catch (e) {
      emit(DashboardError(AppStrings.failedToLoadData)); // Use string constant
    }
  }

  void _onCreateNewProject(CreateNewProject event, Emitter<DashboardState> emit) {
    emit(DashboardError(AppStrings.featureNotImplemented)); // Use string constant
  }

  void _onCreateNewTeam(CreateNewTeam event, Emitter<DashboardState> emit) {
    emit(DashboardError(AppStrings.featureNotImplemented)); // Use string constant
  }
}
