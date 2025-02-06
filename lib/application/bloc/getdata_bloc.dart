import 'package:bloc_skel/data_service.dart';
import 'package:bloc_skel/model/data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'getdata_event.dart';
part 'getdata_state.dart';
part 'getdata_bloc.freezed.dart';

@injectable
class GetdataBloc extends Bloc<GetdataEvent, GetdataState> {
  final IdownloadService _idownloadService;
  GetdataBloc(this._idownloadService) : super(GetdataState.initial()) {
    on<Initilized>((event, emit) async {
      // send Loading to ui
      emit(const GetdataState(
          fastLaughImage: [],
          isLoading: true,
          isError: false,
          unLikedVedios: [],
          likedVedios: []));
      //get trending ,movies
      final result = await _idownloadService.getDownloadsImage();
      final _state = result.fold((l) {
        return GetdataState(
            fastLaughImage: [],
            isLoading: false,
            isError: true,
            likedVedios: state.likedVedios,
            unLikedVedios: state.unLikedVedios);
      }, (r) {
        return GetdataState(
            fastLaughImage: r,
            isLoading: false,
            isError: false,
            likedVedios: state.likedVedios,
            unLikedVedios: state.unLikedVedios);
      });
      emit(_state);
      //show it to ui
    });
    on<Liked>((event, emit) async {
      state.likedVedios.add(event.liked);
      emit(state.copyWith(likedVedios: state.likedVedios));
    });
    on<UnLiked>((event, emit) async {
      state.likedVedios.remove(event.liked);
      emit(state.copyWith(likedVedios: state.likedVedios));
    });
  }
}
