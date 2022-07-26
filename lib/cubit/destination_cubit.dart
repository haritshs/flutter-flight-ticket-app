import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiket_pesawat_bwa/models/destination_model.dart';
import 'package:tiket_pesawat_bwa/services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fecthDestinations() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
