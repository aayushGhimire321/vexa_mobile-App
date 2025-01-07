import 'package:bloc/bloc.dart';
import 'package:vexa/features/settings/presentation/view_model/profile_screen/profile_screen_event.dart';
import 'package:vexa/features/settings/presentation/view_model/profile_screen/profile_screen_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    emit(ProfileLoading());
    // Simulate fetching profile data (replace with your API or database)
    emit(ProfileLoaded(name: "Aayush Ghimire", email: "aghimire781@gmail.com"));
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    emit(ProfileLoading());
    // Simulate updating profile data (replace with your API or database logic)
    emit(ProfileUpdated(name: event.name, email: event.email));
  }
}
