import 'dart:developer';

import 'package:bloc_skel/constants/api_constants.dart';
import 'package:bloc_skel/data_service.dart';
import 'package:bloc_skel/domain/failure.dart';
import 'package:bloc_skel/model/data_model/data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IdownloadService)
class DownloadRepository implements IdownloadService {
  @override
  Future<Either<MainFailure, List<DataModel>>> getDownloadsImage() async {
    // TODO: implement getDownloadsImage
    try {
      final response = await Dio(BaseOptions()).get(jsonData);
      print(response.data.toString());
      //  return right(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("1111111111111111111111111111111");
        print(response.data['data']['banners']);
        final downloadImageList = (response.data['data']['banners'] as List)
            .map((e) => DataModel.fromJson(e))
            .toList();
        //final List<downloadModel> downloadImageList = [];
        log(response.data.toString());

        return Right(downloadImageList);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (_) {
      return const Left(MainFailure.ClientFailure());
    }
  }
}
