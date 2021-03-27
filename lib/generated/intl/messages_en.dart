// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(current, total) => "${current}/${total} task complete";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "btn_add_task" : MessageLookupByLibrary.simpleMessage("ADD TASK"),
    "category_home" : MessageLookupByLibrary.simpleMessage("Home"),
    "category_personal" : MessageLookupByLibrary.simpleMessage("Personal"),
    "category_work" : MessageLookupByLibrary.simpleMessage("Work"),
    "hint_description" : MessageLookupByLibrary.simpleMessage("Description here"),
    "hint_title" : MessageLookupByLibrary.simpleMessage("Title here"),
    "lbl_date" : MessageLookupByLibrary.simpleMessage("Date"),
    "lbl_filter" : MessageLookupByLibrary.simpleMessage("Filter"),
    "lbl_task_complete" : m0,
    "message_error_need_title" : MessageLookupByLibrary.simpleMessage("Please enter title"),
    "title_add_task" : MessageLookupByLibrary.simpleMessage("ADD TASK"),
    "title_home" : MessageLookupByLibrary.simpleMessage("Home Tasks")
  };
}
