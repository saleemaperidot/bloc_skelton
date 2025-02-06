part of 'getdata_bloc.dart';

@freezed
class GetdataState with _$GetdataState {
  const factory GetdataState(
      {required List<int> likedVedios,
      required List<int> unLikedVedios,
      required List<DataModel> fastLaughImage,
      required bool isLoading,
      required bool isError}) = _GetdataState;
  factory GetdataState.initial() => const GetdataState(
      likedVedios: [],
      unLikedVedios: [],
      fastLaughImage: [],
      isLoading: false,
      isError: false);
}
