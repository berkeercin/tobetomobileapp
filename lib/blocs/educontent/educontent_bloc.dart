import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_event.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_state.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';

class EduContentBloc extends Bloc<EduContentEvent, EduContentState> {
  final HomeRepository homeRepository;
  EduContentBloc(this.homeRepository) : super(Initialize()) {
    on<LoadContent>(loadPage);
    on<ReloadPage>(reloadPage);
  }

  reloadPage(ReloadPage event, Emitter<EduContentState> emit) {
    emit(Initialize());
  }

  loadPage(LoadContent event, Emitter<EduContentState> emit) async {
    Education? education = await homeRepository.loadEducation(event.documentId);
    if (education == null) {
      education = Education(
          eduTitle: "",
          eduId: "",
          documentId: "",
          eduThumbnailUrl: "",
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          content: [],
          isActive: true,
          isFinished: false);
      emit(LoadedPage(education));
    } else {
      emit(LoadedPage(education));
    }
  }
}
