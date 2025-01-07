import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_team_page_event.dart';
part 'new_team_page_state.dart';

class NewTeamPageBloc extends Bloc<NewTeamPageEvent, NewTeamPageState> {
  NewTeamPageBloc() : super(NewTeamPageInitial()) {
    on<NewTeamPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
