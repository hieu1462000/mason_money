import 'package:mason_money/models/product_model.dart';
import 'package:mason_money/models/sources/remote/api_config.dart';
import 'package:dio/dio.dart';
import 'package:mason_money/models/sources/remote/params/list_product_params.dart';
import 'package:mason_money/models/sources/remote/responses/product_response.dart';
class ProductRepositories {
  String baseUrl = ApiConfig.baseUrl;

  final Dio _dio = Dio();

  Future<ListProductResponse> getListProduct(ListProductParams listProductParams) async {
    var sizeQuery = "";
    var colorQuery = "";
    for (var element in listProductParams.sizes) {
      sizeQuery += "&sizes=$element";
    }

    for (var element in listProductParams.colors) {
      colorQuery += "&colors=$element";
    }

    final query = "?cateId=${listProductParams.cateId}"
        "&page=${listProductParams.page}&pageSize=${listProductParams.pageSize}"
        "&search=${listProductParams.search}"
        "&priceFrom=${listProductParams.priceFrom}&priceTo=${listProductParams.priceTo}"
        "&sort=${listProductParams.sort}$colorQuery$sizeQuery";
    Response response = await _dio.get("$baseUrl/product/get-list$query",options: Options(
      headers: {
        'X-AUTH-TOKEN': ApiConfig.apiToken,
      },
    ),

    );
    return ListProductResponse.fromMap(response.data);
  }
}