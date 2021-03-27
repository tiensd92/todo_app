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

  /// `Home Tasks`
  String get title_home {
    return Intl.message(
      'Home Tasks',
      name: 'title_home',
      desc: '',
      args: [],
    );
  }

  /// `{current}/{total} task complete`
  String lbl_task_complete(Object current, Object total) {
    return Intl.message(
      '$current/$total task complete',
      name: 'lbl_task_complete',
      desc: '',
      args: [current, total],
    );
  }

  /// `ADD TASK`
  String get title_add_task {
    return Intl.message(
      'ADD TASK',
      name: 'title_add_task',
      desc: '',
      args: [],
    );
  }

  /// `Title here`
  String get hint_title {
    return Intl.message(
      'Title here',
      name: 'hint_title',
      desc: '',
      args: [],
    );
  }

  /// `Description here`
  String get hint_description {
    return Intl.message(
      'Description here',
      name: 'hint_description',
      desc: '',
      args: [],
    );
  }

  /// `Please enter title`
  String get message_error_need_title {
    return Intl.message(
      'Please enter title',
      name: 'message_error_need_title',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get lbl_filter {
    return Intl.message(
      'Filter',
      name: 'lbl_filter',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get category_work {
    return Intl.message(
      'Work',
      name: 'category_work',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get category_home {
    return Intl.message(
      'Home',
      name: 'category_home',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get category_personal {
    return Intl.message(
      'Personal',
      name: 'category_personal',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get lbl_date {
    return Intl.message(
      'Date',
      name: 'lbl_date',
      desc: '',
      args: [],
    );
  }

  /// `ADD TASK`
  String get btn_add_task {
    return Intl.message(
      'ADD TASK',
      name: 'btn_add_task',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
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