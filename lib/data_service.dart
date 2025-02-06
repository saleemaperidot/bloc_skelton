import 'package:bloc_skel/domain/failure.dart';
import 'package:bloc_skel/model/data_model/data_model.dart';
import 'package:dartz/dartz.dart';

abstract class IdownloadService {
  Future<Either<MainFailure, List<DataModel>>> getDownloadsImage();
}
