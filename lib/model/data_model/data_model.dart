import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
	String? image;
	String? title;
	String? subtitle;

	DataModel({this.image, this.title, this.subtitle});

	factory DataModel.fromJson(Map<String, dynamic> json) {
		return _$DataModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
