import 'package:road_to_news/model/CategoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1612550761236-e813928f7271?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=666&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1434494878577-86c23bcb06b9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  return category;
}
