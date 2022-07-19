// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add Bussines`
  String get addBussines {
    return Intl.message(
      'Add Bussines',
      name: 'addBussines',
      desc: '',
      args: [],
    );
  }

  /// `Add Post`
  String get addPost {
    return Intl.message(
      'Add Post',
      name: 'addPost',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get Personal {
    return Intl.message(
      'Personal',
      name: 'Personal',
      desc: '',
      args: [],
    );
  }

  /// `Properties:`
  String get Properties {
    return Intl.message(
      'Properties:',
      name: 'Properties',
      desc: '',
      args: [],
    );
  }

  /// `Cars`
  String get Cars {
    return Intl.message(
      'Cars',
      name: 'Cars',
      desc: '',
      args: [],
    );
  }

  /// `Choose interests`
  String get chooseInterests {
    return Intl.message(
      'Choose interests',
      name: 'chooseInterests',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get Likes {
    return Intl.message(
      'Likes',
      name: 'Likes',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get Business {
    return Intl.message(
      'Business',
      name: 'Business',
      desc: '',
      args: [],
    );
  }

  /// `No Results Found`
  String get noResultsFound {
    return Intl.message(
      'No Results Found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Services {
    return Intl.message(
      'Services',
      name: 'Services',
      desc: '',
      args: [],
    );
  }

  /// `Photo Filter`
  String get photoFilter {
    return Intl.message(
      'Photo Filter',
      name: 'photoFilter',
      desc: '',
      args: [],
    );
  }

  /// `Select cities and services`
  String get selectCitiesAndServices {
    return Intl.message(
      'Select cities and services',
      name: 'selectCitiesAndServices',
      desc: '',
      args: [],
    );
  }

  /// `Select Image Please`
  String get selectImagePlease {
    return Intl.message(
      'Select Image Please',
      name: 'selectImagePlease',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message(
      'Camera',
      name: 'Camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get Gallery {
    return Intl.message(
      'Gallery',
      name: 'Gallery',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `Business Name`
  String get businessName {
    return Intl.message(
      'Business Name',
      name: 'businessName',
      desc: '',
      args: [],
    );
  }

  /// `fill the field`
  String get fillTheField {
    return Intl.message(
      'fill the field',
      name: 'fillTheField',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Business Phone`
  String get businessPhone {
    return Intl.message(
      'Business Phone',
      name: 'businessPhone',
      desc: '',
      args: [],
    );
  }

  /// `Add Location`
  String get addLocation {
    return Intl.message(
      'Add Location',
      name: 'addLocation',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get addService {
    return Intl.message(
      'Add Service',
      name: 'addService',
      desc: '',
      args: [],
    );
  }

  /// `No posts yet`
  String get noPostsYet {
    return Intl.message(
      'No posts yet',
      name: 'noPostsYet',
      desc: '',
      args: [],
    );
  }

  /// `Liked by`
  String get likedBy {
    return Intl.message(
      'Liked by',
      name: 'likedBy',
      desc: '',
      args: [],
    );
  }

  /// `Unfollow`
  String get Unfollow {
    return Intl.message(
      'Unfollow',
      name: 'Unfollow',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get Follow {
    return Intl.message(
      'Follow',
      name: 'Follow',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `Call Now`
  String get CallNow {
    return Intl.message(
      'Call Now',
      name: 'CallNow',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Add review`
  String get addReview {
    return Intl.message(
      'Add review',
      name: 'addReview',
      desc: '',
      args: [],
    );
  }

  /// `No Reviews yet`
  String get noReviewsYet {
    return Intl.message(
      'No Reviews yet',
      name: 'noReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `Edit business`
  String get editBusiness {
    return Intl.message(
      'Edit business',
      name: 'editBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get Info {
    return Intl.message(
      'Info',
      name: 'Info',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get Posts {
    return Intl.message(
      'Posts',
      name: 'Posts',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get Review {
    return Intl.message(
      'Review',
      name: 'Review',
      desc: '',
      args: [],
    );
  }

  /// `Delete business`
  String get deleteBusiness {
    return Intl.message(
      'Delete business',
      name: 'deleteBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want this business`
  String get doYouReallyWantThisBusiness {
    return Intl.message(
      'Do you really want this business',
      name: 'doYouReallyWantThisBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePost {
    return Intl.message(
      'Delete Post',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Edit account`
  String get editAccount {
    return Intl.message(
      'Edit account',
      name: 'editAccount',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `You Can Now Change Your Number`
  String get sendOtpToVerify {
    return Intl.message(
      'You Can Now Change Your Number',
      name: 'sendOtpToVerify',
      desc: '',
      args: [],
    );
  }

  /// `Birthday Date`
  String get birthdayDate {
    return Intl.message(
      'Birthday Date',
      name: 'birthdayDate',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `Rather not to say`
  String get ratherNotToSay {
    return Intl.message(
      'Rather not to say',
      name: 'ratherNotToSay',
      desc: '',
      args: [],
    );
  }

  /// `Account Info`
  String get accountInfo {
    return Intl.message(
      'Account Info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appVersion {
    return Intl.message(
      'App Version',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `Your Bees`
  String get yourBees {
    return Intl.message(
      'Your Bees',
      name: 'yourBees',
      desc: '',
      args: [],
    );
  }

  /// `Businesses I follow`
  String get businessesIFollow {
    return Intl.message(
      'Businesses I follow',
      name: 'businessesIFollow',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get logOut {
    return Intl.message(
      'LogOut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to logout`
  String get doYouReallyWantToLogOut {
    return Intl.message(
      'Do you really want to logout',
      name: 'doYouReallyWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `visitors`
  String get visitors {
    return Intl.message(
      'visitors',
      name: 'visitors',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get selectCategory {
    return Intl.message(
      'Select category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Search for service`
  String get searchForService {
    return Intl.message(
      'Search for service',
      name: 'searchForService',
      desc: '',
      args: [],
    );
  }

  /// `Choose main cat`
  String get chooseMainCat {
    return Intl.message(
      'Choose main cat',
      name: 'chooseMainCat',
      desc: '',
      args: [],
    );
  }

  /// `Choose Sub Cat`
  String get chooseSubCat {
    return Intl.message(
      'Choose Sub Cat',
      name: 'chooseSubCat',
      desc: '',
      args: [],
    );
  }

  /// `Choose Services`
  String get chooseServices {
    return Intl.message(
      'Choose Services',
      name: 'chooseServices',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get Followers {
    return Intl.message(
      'Followers',
      name: 'Followers',
      desc: '',
      args: [],
    );
  }

  /// `You are following`
  String get youAreFollowing {
    return Intl.message(
      'You are following',
      name: 'youAreFollowing',
      desc: '',
      args: [],
    );
  }

  /// `Search for location`
  String get searchForLocation {
    return Intl.message(
      'Search for location',
      name: 'searchForLocation',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get Person {
    return Intl.message(
      'Person',
      name: 'Person',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get People {
    return Intl.message(
      'People',
      name: 'People',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}