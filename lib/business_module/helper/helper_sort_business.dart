import 'package:brandsome/business_module/helper/enum_sort.dart';

class HelperBusinessSort{
  static String getBusinessSortString(BusinessSortEnum? status) {
    switch (status) {
      case BusinessSortEnum.REVIEWS:
        return 'reviews';
      case BusinessSortEnum.VIEWS:
        return 'views';
      case BusinessSortEnum.A_Z:
        return 'A_Z';
      case BusinessSortEnum.FOLLOWERS:
        return 'follwers';
      case BusinessSortEnum.POSTS:
        return 'follwers';
      default:
        return '';
    }
  }
}