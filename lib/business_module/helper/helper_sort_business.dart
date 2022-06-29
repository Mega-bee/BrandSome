import 'package:brandsome/business_module/helper/enum_sort.dart';

class HelperBusinessSort{
  static String getBusinessSortString(BusinessSortEnum? status) {
    switch (status) {
      case BusinessSortEnum.REVIEWS:
        return 'ReviewCount';
      case BusinessSortEnum.VIEWS:
        return 'ViewCount';
      case BusinessSortEnum.A_Z:
        return 'A-Z';
      case BusinessSortEnum.FOLLOWERS:
        return 'FollowCount';
      case BusinessSortEnum.POSTS:
        return 'PostCount';
      default:
        return '';
    }
  }
}