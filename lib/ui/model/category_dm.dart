import 'package:news/ui/utilites/app_asstes.dart';

class CategoryDm {
  String id;
  String text;
  String imagePath;
  CategoryDm(this.id, this.text, this.imagePath);
  static List<CategoryDm> getCategories(bool isDarkMode) {
    return [
      CategoryDm(
        "general",
        "general",
        !isDarkMode ? AppAsstes.generalD : AppAsstes.generalL,
      ),
      CategoryDm(
        "business",
        "business",
        !isDarkMode ? AppAsstes.businessD : AppAsstes.businessL,
      ),
      CategoryDm(
        "sports",
        "sports",
        !isDarkMode ? AppAsstes.sportD : AppAsstes.sportL,
      ),

      CategoryDm(
        "health",
        "health",
        !isDarkMode ? AppAsstes.healthD : AppAsstes.healthL,
      ),
      CategoryDm(
        "entertainment",
        "entertainment",
        !isDarkMode ? AppAsstes.enterantmentD : AppAsstes.enterantmentL,
      ),

      CategoryDm(
        "technology",
        "technology",
        !isDarkMode ? AppAsstes.technologyD : AppAsstes.technologyL,
      ),
      CategoryDm(
        "science",
        "science",
        !isDarkMode ? AppAsstes.scinceD : AppAsstes.scinceL,
      ),
    ];
  }
}
