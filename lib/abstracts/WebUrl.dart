
class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://brandsome.azurewebsites.net';

  static const String BASE_API_BUSINESS = DOMAIN + '/api/Businesses/';
  static const String BASE_API_FILTER = DOMAIN + '/api/Interests/';
  static const String BASE_API_POSTS = DOMAIN + '/api/Posts/';
  // static const String BASE_API_PATIENTS = DOMAIN + '/api/Patients';
  // static const String BASE_API_NOTIFICATIONS=DOMAIN+'/api/Notifications';
  /*--------Auth-------------------*/
  // static const LOGIN = BASE_API_ACCOUNT + '/SignIn';
  // static const FORGET_PASS = BASE_API_ACCOUNT + '/ForgetPassword';


  /*--------home-------------------*/
  static const GET_BUSINESS = BASE_API_BUSINESS + 'GetBusinesses';
  static const GET_BUSINESS_DETAILS = BASE_API_BUSINESS + 'GetBusiness/';
  static const GET_FILTER = BASE_API_FILTER + 'GetSearchCategories';
  static const GET_LIKED_POSTS = BASE_API_FILTER + 'LikeList/';

  //
  // /*--------DEVICE-------------------*/
  // static const DEVICEQR =DOMAIN+ '/api/Devices/AssignWatchToPatient/';

}
