import 'package:dio/dio.dart';
import 'package:mason_money/models/category_model.dart';
import 'package:mason_money/models/sources/remote/api_config.dart';
import 'package:mason_money/models/sources/remote/responses/list_model_responses.dart';

class CategoryRepositories {
  String baseUrl = ApiConfig.baseUrl;

  final Dio _dio = Dio();

  Future<ListModelResponse<CategoryModel>> getParentCategories() async {
    Response response = await _dio.get("$baseUrl/menu/get-menu-parent",
        options: Options(headers: {
          'X-AUTH-TOKEN': ApiConfig.apiToken,
        }));
    return ListModelResponse<CategoryModel>.fromMap(
        response.data, CategoryModel.fromJson);
  }

  Future<ListModelResponse<CategoryModel>> getChildCategories(
      int parentID) async {
    Response response = await _dio.get("$baseUrl/menu/get-menu-child/$parentID",
        options: Options(headers: {
          'X-AUTH-TOKEN': ApiConfig.apiToken,
          'Accept': 'text/plain'
        }));
    return ListModelResponse<CategoryModel>.fromMap(
        response.data, CategoryModel.fromJson);
  }
}
