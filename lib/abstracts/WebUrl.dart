
class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://brandsome.azurewebsites.net';

  static const String BASE_API_BUSINESS = DOMAIN + '/api/Businesses/';
  static const String BASE_API_FILTER = DOMAIN + '/api/Interests/';
  static const String BASE_API_POSTS = DOMAIN + '/api/Posts/';
  static const String BSE_API_SETTINGS = DOMAIN + '/api/Accounts/';
  static const String BSE_API_LOCATION = DOMAIN + '/api/General/';


  // static const String BASE_API_PATIENTS = DOMAIN + '/api/Patients';
  // static const String BASE_API_NOTIFICATIONS=DOMAIN+'/api/Notifications';
//  /*--------Auth-------------------*/
   static const REQUEST_OTP = BSE_API_SETTINGS + 'RequestOtp';
   static const VERIFY_OTP = BSE_API_SETTINGS + 'VerifyOtp';


  /*--------home-------------------*/
  static const GET_BUSINESS = BASE_API_BUSINESS + 'GetBusinesses';
  static const CREATE_BUSINESS = BASE_API_BUSINESS + 'CreateBusiness';
  static const GET_BUSINESS_DETAILS = BASE_API_BUSINESS + 'GetBusiness/';
  static const PHONE_CLICK = BASE_API_BUSINESS + 'RegisterNewPhoneClick/';
  static const CREATE_REVIEW = BASE_API_BUSINESS + 'CreateReview';
  static const GET_FILTER = BASE_API_FILTER + 'GetSearchCategories';
  static const GET_LIKED_POSTS = BASE_API_POSTS + 'LikeList/';

  //
  /*--------Settings-------------------*/
  static const ACCOUNTS_SETTINGS =BSE_API_SETTINGS + 'GetAccountSetings';
  static const GETPROFILE =BSE_API_SETTINGS + 'GetProfile';
  static const UPDATE_PROFILE =BSE_API_SETTINGS + 'UpdateProfile';
  static const GETFOLLOWEDBUSINESSES =BSE_API_SETTINGS + 'GetFollowedBusinessses';
  static const GETLOCATION =BSE_API_LOCATION + 'GetCities';

}
