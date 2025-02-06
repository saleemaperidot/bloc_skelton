part of 'getdata_bloc.dart';

@freezed
class GetdataEvent with _$GetdataEvent {
  const factory GetdataEvent.initilized() = Initilized;
  const factory GetdataEvent.liked({required int liked}) = Liked;
  const factory GetdataEvent.unLiked({required int liked}) = UnLiked;
}
