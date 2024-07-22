import 'package:musicapp/models/categories.dart';

class CategoryOptions{
  CategoryOptions._(){}
  static List<Categories> getCategories(){
    return <Categories>[
      Categories('Top Songs', 'assets/img.png'),
      Categories('Romantic Hits','assets/img_1.png'),
      Categories('Marathi Hits', 'assets/img_2.png'),
      Categories('Top Songs', 'assets/img.png'),
      Categories('Romantic Hits','assets/img_1.png'),
      Categories('Marathi Hits', 'assets/img_2.png'),
    ];
  }
}