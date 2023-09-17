import 'category_content.dart';

class CategoryUiStatus {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";
  bool isSuccess = false;
  List<CategoryContentUI>? categoriesContent = [];

  CategoryUiStatus(
      {this.isLoading = false,
      this.isError = false,
      this.isSuccess = false,
      this.errorMessage = "error",
      this.categoriesContent});
}
