import 'package:bloc/bloc.dart';
import 'package:vexa/app/constants/strings.dart';
import 'package:vexa/features/dashboard/presentation/view_model/your_work_page/your_work_page_event.dart';
import 'package:vexa/features/dashboard/presentation/view_model/your_work_page/your_work_page_state.dart'; // Ensure this import points to your `AppStrings`

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  List<Map<String, dynamic>> works = []; // Mock database for works

  WorkBloc() : super(WorkInitial()) {
    on<LoadWorks>(_onLoadWorks);
    on<CreateWork>(_onCreateWork);
  }

  Future<void> _onLoadWorks(LoadWorks event, Emitter<WorkState> emit) async {
    emit(WorkLoading());
    try {
      // Simulate loading delay
      await Future.delayed(Duration(seconds: 2));
      if (works.isEmpty) {
        emit(WorkLoaded([]));
      } else {
        emit(WorkLoaded(works));
      }
    } catch (e) {
      emit(WorkError(AppStrings.failedToLoadData));
    }
  }

  Future<void> _onCreateWork(CreateWork event, Emitter<WorkState> emit) async {
    emit(WorkLoading());
    try {
      // Add the new work to the list
      works.add({
        'title': event.title,
        'description': event.description,
        'tags': event.tags,
      });
      emit(WorkLoaded(works));
    } catch (e) {
      emit(WorkError(AppStrings.genericErrorMessage));
    }
  }
}
