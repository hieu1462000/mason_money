class ListProductParams {
  String? search;
  int cateId;
  List<String> colors;
  List<String> sizes;
  double? priceFrom;
  double? priceTo;
  String sort;
  int? page;
  int? pageSize;

  ListProductParams({
    this.search = "",
    this.cateId = 1,
    this.colors = const <String> [],
    this.sizes = const <String>[],
    this.priceFrom = 0,
    this.priceTo = 1000000,
    this.sort ="",
    this.page = 1,
    this.pageSize = 10,
});
}