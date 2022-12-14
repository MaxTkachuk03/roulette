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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `RouLeTTe`
  String get splashScreenText {
    return Intl.message(
      'RouLeTTe',
      name: 'splashScreenText',
      desc: '',
      args: [],
    );
  }

  /// `Game`
  String get game {
    return Intl.message(
      'Game',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get logIn {
    return Intl.message(
      'Login',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Anonymous Sign IN`
  String get anonymous {
    return Intl.message(
      'Anonymous Sign IN',
      name: 'anonymous',
      desc: '',
      args: [],
    );
  }

  /// `WeLCoMe`
  String get welcome {
    return Intl.message(
      'WeLCoMe',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Who are You?`
  String get who {
    return Intl.message(
      'Who are You?',
      name: 'who',
      desc: '',
      args: [],
    );
  }

  /// `Please write your nickname`
  String get name {
    return Intl.message(
      'Please write your nickname',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get next {
    return Intl.message(
      'Continue',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Email verification sent!`
  String get sent {
    return Intl.message(
      'Email verification sent!',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Please write your email`
  String get email {
    return Intl.message(
      'Please write your email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please write password`
  String get passw0rd {
    return Intl.message(
      'Please write password',
      name: 'passw0rd',
      desc: '',
      args: [],
    );
  }

  /// `Log OUT`
  String get signOut {
    return Intl.message(
      'Log OUT',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete {
    return Intl.message(
      'Delete Account',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get nickName {
    return Intl.message(
      'Nickname',
      name: 'nickName',
      desc: '',
      args: [],
    );
  }

  /// `Chips`
  String get chips {
    return Intl.message(
      'Chips',
      name: 'chips',
      desc: '',
      args: [],
    );
  }

  /// `No User`
  String get noUser {
    return Intl.message(
      'No User',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Rate app`
  String get rateApp {
    return Intl.message(
      'Rate app',
      name: 'rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Bet`
  String get bet {
    return Intl.message(
      'Bet',
      name: 'bet',
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
