
class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://brandsome.azurewebsites.net';

  static const String BASE_API_BUSINESS = DOMAIN + '/api/Businesses/';
  static const String BSE_API_SETTINGS = DOMAIN + '/api/Accounts/';


  // static const String BASE_API_PATIENTS = DOMAIN + '/api/Patients';
  // static const String BASE_API_NOTIFICATIONS=DOMAIN+'/api/Notifications';
  /*--------Auth-------------------*/
  // static const LOGIN = BASE_API_ACCOUNT + '/SignIn';
  // static const FORGET_PASS = BASE_API_ACCOUNT + '/ForgetPassword';


  /*--------home-------------------*/
  static const GET_BUSINESS = BASE_API_BUSINESS + 'GetBusinesses';
  static const GET_BUSINESS_DETAILS = BASE_API_BUSINESS + 'GetBusiness/';

  //
  /*--------Settings-------------------*/
  static const ACCOUNTS_SETTINGS =BSE_API_SETTINGS + 'GetAccountSetings';
  static const GETPROFILE =BSE_API_SETTINGS + 'GetProfile';
  static const GETFOLLOWEDBUSINESSES =BSE_API_SETTINGS + 'GetFollowedBusinessses';

}
