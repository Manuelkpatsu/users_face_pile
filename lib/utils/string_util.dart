/*
 * ===========================================================================
 * Copyright (c) 2022, Mobile Realm, Ghana
 *
 * This file and its contents are proprietary and confidential to and the sole
 * intellectual property of Mobile Realm.  Any use, reproduction,
 * redistribution or modification of this file is prohibited except as
 * explicitly defined by written license agreement with Mobile Realm.
 * ===========================================================================
 */

class StringUtil {
  static String getInitialsForName(String name) {
    return name.isNotEmpty
        ? name
            .trim()
            .split(' ')
            .where((name) => name.isNotEmpty)
            .map((name) => name[0])
            .take(2)
            .join()
        : '';
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
