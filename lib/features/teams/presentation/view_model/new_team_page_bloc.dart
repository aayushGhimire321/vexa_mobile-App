import 'package:bloc/bloc.dart';

import 'new_team_page_event.dart';
import 'new_team_page_state.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  TeamsBloc() : super(TeamsInitial()) {
    on<LoadTeams>(_onLoadTeams);
    on<CreateTeam>(_onCreateTeam);
  }

  List<Team> _teams = [];

  void _onLoadTeams(LoadTeams event, Emitter<TeamsState> emit) {
    emit(TeamsLoading());
    // Simulate fetching teams from a server or database
    _teams = [
      Team(id: 1, name: "Development Team", description: "Handles all development tasks"),
      Team(id: 2, name: "Design Team", description: "Focuses on UI/UX design"),
    ];
    emit(TeamsLoaded(teams: _teams));
  }

  void _onCreateTeam(CreateTeam event, Emitter<TeamsState> emit) {
    final newTeam = Team(
      id: _teams.length + 1,
      name: event.teamName,
      description: event.description,
    );
    _teams.add(newTeam);
    emit(TeamsLoaded(teams: _teams));
  }
}
