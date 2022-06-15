// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

const List<String> _int2hex = <String>[
  '00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '0a', '0b', '0c', '0d', '0e', '0f',
  '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '1a', '1b', '1c', '1d', '1e', '1f',
  '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '2a', '2b', '2c', '2d', '2e', '2f',
  '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '3a', '3b', '3c', '3d', '3e', '3f',
  '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '4a', '4b', '4c', '4d', '4e', '4f',
  '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '5a', '5b', '5c', '5d', '5e', '5f',
  '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '6a', '6b', '6c', '6d', '6e', '6f',
  '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '7a', '7b', '7c', '7d', '7e', '7f',
  '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '8a', '8b', '8c', '8d', '8e', '8f',
  '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '9a', '9b', '9c', '9d', '9e', '9f',
  'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'aa', 'ab', 'ac', 'ad', 'ae', 'af',
  'b0', 'b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 'b9', 'ba', 'bb', 'bc', 'bd', 'be', 'bf',
  'c0', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9', 'ca', 'cb', 'cc', 'cd', 'ce', 'cf',
  'd0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'd8', 'd9', 'da', 'db', 'dc', 'dd', 'de', 'df',
  'e0', 'e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7', 'e8', 'e9', 'ea', 'eb', 'ec', 'ed', 'ee', 'ef',
  'f0', 'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'fa', 'fb', 'fc', 'fd', 'fe', 'ff',
];

String int8ToHex(int number) {
  assert((number | 0xff) == 0xff);

  return _int2hex[number];
}

String int16ToHexBig(int number) {
  assert((number | 0xffff) == 0xffff);

  return
    '${_int2hex[number >>> 8]}'
    '${_int2hex[number & 0xff]}';
}
String int24ToHexBig(int number) {
  assert((number | 0xffffff) == 0xffffff);

  return
    '${_int2hex[number >>> 16]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number & 0xff]}';
}
String int32ToHexBig(int number) {
  assert((number | 0xffffffff) == 0xffffffff);

  return
    '${_int2hex[number >>> 24]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number & 0xff]}';
}
String int40ToHexBig(int number) {
  assert((number | 0xffffffffff) == 0xffffffffff);

  return
    '${_int2hex[number >>> 32]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number & 0xff]}';
}
String int48ToHexBig(int number) {
  assert((number | 0xffffffffffff) == 0xffffffffffff);

  return
    '${_int2hex[number >>> 40]}'
    '${_int2hex[(number >>> 32) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number & 0xff]}';
}
String int56ToHexBig(int number) {
  assert((number | 0xffffffffffffff) == 0xffffffffffffff);

  return
    '${_int2hex[number >>> 48]}'
    '${_int2hex[(number >>> 40) & 0xff]}'
    '${_int2hex[(number >>> 32) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number & 0xff]}';
}
String int64ToHexBig(int number) {
  assert((number | 0xffffffffffffffff) == 0xffffffffffffffff);

  return
    '${_int2hex[number >>> 56]}'
    '${_int2hex[(number >>> 48) & 0xff]}'
    '${_int2hex[(number >>> 40) & 0xff]}'
    '${_int2hex[(number >>> 32) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number & 0xff]}';
}

String int16ToHexLittle(int number) {
  assert((number | 0xffff) == 0xffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[number >>> 8]}';
}
String int24ToHexLittle(int number) {
  assert((number | 0xffffff) == 0xffffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[number >>> 16]}';
}
String int32ToHexLittle(int number) {
  assert((number | 0xffffffff) == 0xffffffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[number >>> 24]}';
}
String int40ToHexLittle(int number) {
  assert((number | 0xffffffffff) == 0xffffffffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[number >>> 32]}';
}
String int48ToHexLittle(int number) {
  assert((number | 0xffffffffffff) == 0xffffffffffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 32) & 0xff]}'
    '${_int2hex[number >>> 40]}';
}
String int56ToHexLittle(int number) {
  assert((number | 0xffffffffffffff) == 0xffffffffffffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 32) & 0xff]}'
    '${_int2hex[(number >>> 40) & 0xff]}'
    '${_int2hex[number >>> 48]}';
}
String int64ToHexLittle(int number) {
  assert((number | 0xffffffffffffffff) == 0xffffffffffffffff);

  return
    '${_int2hex[number & 0xff]}'
    '${_int2hex[(number >>> 8) & 0xff]}'
    '${_int2hex[(number >>> 16) & 0xff]}'
    '${_int2hex[(number >>> 24) & 0xff]}'
    '${_int2hex[(number >>> 32) & 0xff]}'
    '${_int2hex[(number >>> 40) & 0xff]}'
    '${_int2hex[(number >>> 48) & 0xff]}'
    '${_int2hex[number >>> 56]}';
}

String intToHexBig(int number) {
  if ((number | 0xff) == 0xff) {
    return int8ToHex(number);
  }
  else if ((number | 0xffff) == 0xffff) {
    return int16ToHexBig(number);
  }
  else if ((number | 0xffffff) == 0xffffff) {
    return int24ToHexBig(number);
  }
  else if ((number | 0xffffffff) == 0xffffffff) {
    return int32ToHexBig(number);
  }
  else if ((number | 0xffffffffff) == 0xffffffffff) {
    return int40ToHexBig(number);
  }
  else if ((number | 0xffffffffffff) == 0xffffffffffff) {
    return int48ToHexBig(number);
  }
  else if ((number | 0xffffffffffffff) == 0xffffffffffffff) {
    return int56ToHexBig(number);
  }
  else {
    return int64ToHexBig(number);
  }
}
String intToHexLittle(int number) {
  if ((number | 0xff) == 0xff) {
    return int8ToHex(number);
  }
  else if ((number | 0xffff) == 0xffff) {
    return int16ToHexLittle(number);
  }
  else if ((number | 0xffffff) == 0xffffff) {
    return int24ToHexLittle(number);
  }
  else if ((number | 0xffffffff) == 0xffffffff) {
    return int32ToHexLittle(number);
  }
  else if ((number | 0xffffffffff) == 0xffffffffff) {
    return int40ToHexLittle(number);
  }
  else if ((number | 0xffffffffffff) == 0xffffffffffff) {
    return int48ToHexLittle(number);
  }
  else if ((number | 0xffffffffffffff) == 0xffffffffffffff) {
    return int56ToHexLittle(number);
  }
  else {
    return int64ToHexLittle(number);
  }
}
String intToHex(int number, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? intToHexBig(number)
    : intToHexLittle(number);
}

int hexToInt8(String hex) {
  assert(hex.length <= 2);

  return int.parse(hex, radix: 16);
}

int hexToInt16Big(String hex) {
  assert(2 < hex.length && hex.length <= 4);

  return int.parse(hex, radix: 16);
}
int hexToInt24Big(String hex) {
  assert(4 < hex.length && hex.length <= 6);

  return int.parse(hex, radix: 16);
}
int hexToInt32Big(String hex) {
  assert(6 < hex.length && hex.length <= 8);

  return int.parse(hex, radix: 16);
}
int hexToInt40Big(String hex) {
  assert(8 < hex.length && hex.length <= 10);

  return int.parse(hex, radix: 16);
}
int hexToInt48Big(String hex) {
  assert(10 < hex.length && hex.length <= 12);

  return int.parse(hex, radix: 16);
}
int hexToInt56Big(String hex) {
  assert(12 < hex.length && hex.length <= 14);

  return int.parse(hex, radix: 16);
}
int hexToInt64Big(String hex) {
  assert(14 < hex.length && hex.length <= 16);

  final int half = 8 - (hex.length % 2);

  return
    int.parse(hex.substring(0, half), radix: 16) << 32 |
    int.parse(hex.substring(half), radix: 16);
}

int hexToInt16Little(String hex) {
  assert(2 < hex.length && hex.length <= 4);

  final int a = int.parse(hex, radix: 16);
  return
    (a & 0x00ff) << 8 |
    (a >>> 8);
}
int hexToInt24Little(String hex) {
  assert(4 < hex.length && hex.length <= 6);

  final int a = int.parse(hex, radix: 16);
  return
    (a & 0x0000ff) << 16 |
    (a & 0x00ff00) |
    (a >>> 16);
}
int hexToInt32Little(String hex) {
  assert(6 < hex.length && hex.length <= 8);

  final int a = int.parse(hex, radix: 16);
  return
    (a & 0x000000ff) << 24 |
    (a & 0x0000ff00) << 8 |
    (a & 0x00ff0000) >>> 8 |
    (a >>> 24);
}
int hexToInt40Little(String hex) {
  assert(8 < hex.length && hex.length <= 10);

  final int a = int.parse(hex, radix: 16);
  return
    (a & 0x00000000ff) << 32 |
    (a & 0x000000ff00) << 16 |
    (a & 0x0000ff0000) |
    (a & 0x00ff000000) >>> 16 |
    (a >>> 32);
}
int hexToInt48Little(String hex) {
  assert(10 < hex.length && hex.length <= 12);

  final int a = int.parse(hex, radix: 16);
  return
    (a & 0x0000000000ff) << 40 |
    (a & 0x00000000ff00) << 24 |
    (a & 0x000000ff0000) << 8 |
    (a & 0x0000ff000000) >>> 8 |
    (a & 0x00ff00000000) >>> 24 |
    (a >>> 40);
}
int hexToInt56Little(String hex) {
  assert(12 < hex.length && hex.length <= 14);

  final int a = int.parse(hex, radix: 16);
  return
    (a & 0x000000000000ff) << 48 |
    (a & 0x0000000000ff00) << 32 |
    (a & 0x00000000ff0000) << 16 |
    (a & 0x000000ff000000) |
    (a & 0x0000ff00000000) >>> 16 |
    (a & 0x00ff0000000000) >>> 32 |
    (a >>> 48);
}
int hexToInt64Little(String hex) {
  assert(14 < hex.length && hex.length <= 16);

  final int half = 8 - (hex.length % 2);

  final int a = int.parse(hex.substring(0, half), radix: 16);
  final int b = int.parse(hex.substring(half), radix: 16);
  return
    b << 56 |
    (b & 0x000000000000ff00) << 40 |
    (b & 0x0000000000ff0000) << 24 |
    (b & 0x00000000ff000000) << 8 |
    (a & 0x00000000000000ff) << 24 |
    (a & 0x000000000000ff00) << 8 |
    (a & 0x0000000000ff0000) >>> 8 |
    (a & 0x00000000ff000000) >>> 24;
}

int hexToIntBig(String hex) {
  final int hexLength = hex.length;

  if (hexLength <= 2) {
    return hexToInt8(hex);
  }
  else if (hexLength <= 4) {
    return hexToInt16Big(hex);
  }
  else if (hexLength <= 6) {
    return hexToInt24Big(hex);
  }
  else if (hexLength <= 8) {
    return hexToInt32Big(hex);
  }
  else if (hexLength <= 10) {
    return hexToInt40Big(hex);
  }
  else if (hexLength <= 12) {
    return hexToInt48Big(hex);
  }
  else if (hexLength <= 14) {
    return hexToInt56Big(hex);
  }
  else {
    throw ArgumentError('Input parameter \'hex\' outside of \'int\' boundary.');
  }
}
int hexToIntLittle(String hex) {
  final int hexLength = hex.length;

  if (hexLength <= 2) {
    return hexToInt8(hex);
  }
  else if (hexLength <= 4) {
    return hexToInt16Little(hex);
  }
  else if (hexLength <= 6) {
    return hexToInt24Little(hex);
  }
  else if (hexLength <= 8) {
    return hexToInt32Little(hex);
  }
  else if (hexLength <= 10) {
    return hexToInt40Little(hex);
  }
  else if (hexLength <= 12) {
    return hexToInt48Little(hex);
  }
  else if (hexLength <= 14) {
    return hexToInt56Little(hex);
  }
  else {
    throw ArgumentError('Input parameter \'hex\' outside of \'int\' boundary.');
  }
}
int hexToInt(String hex, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? hexToIntBig(hex)
    : hexToIntLittle(hex);
}

extension IntToHexExtension on int {
  String asInt8ToHex() => int8ToHex(this);

  String asInt16ToHexBig() => int16ToHexBig(this);
  String asInt24ToHexBig() => int24ToHexBig(this);
  String asInt32ToHexBig() => int32ToHexBig(this);
  String asInt40ToHexBig() => int40ToHexBig(this);
  String asInt48ToHexBig() => int48ToHexBig(this);
  String asInt56ToHexBig() => int56ToHexBig(this);
  String asInt64ToHexBig() => int64ToHexBig(this);

  String asInt16ToHexLittle() => int16ToHexLittle(this);
  String asInt24ToHexLittle() => int24ToHexLittle(this);
  String asInt32ToHexLittle() => int32ToHexLittle(this);
  String asInt40ToHexLittle() => int40ToHexLittle(this);
  String asInt48ToHexLittle() => int48ToHexLittle(this);
  String asInt56ToHexLittle() => int56ToHexLittle(this);
  String asInt64ToHexLittle() => int64ToHexLittle(this);

  String toHexBig() => intToHexBig(this);
  String toHexLittle() => intToHexLittle(this);
  String toHex([ Endian endian = Endian.big ]) => intToHex(this, endian);
}

extension HexToIntExtension on String {
  int toInt8() => hexToInt8(this);

  int toInt16Big() => hexToInt16Big(this);
  int toInt24Big() => hexToInt24Big(this);
  int toInt32Big() => hexToInt32Big(this);
  int toInt40Big() => hexToInt40Big(this);
  int toInt48Big() => hexToInt48Big(this);
  int toInt56Big() => hexToInt56Big(this);
  int toInt64Big() => hexToInt64Big(this);

  int toInt16Little() => hexToInt16Little(this);
  int toInt24Little() => hexToInt24Little(this);
  int toInt32Little() => hexToInt32Little(this);
  int toInt40Little() => hexToInt40Little(this);
  int toInt48Little() => hexToInt48Little(this);
  int toInt56Little() => hexToInt56Little(this);
  int toInt64Little() => hexToInt64Little(this);

  int toIntBig() => hexToIntBig(this);
  int toIntLittle() => hexToIntLittle(this);
  int toInt([ Endian endian = Endian.big ]) => hexToInt(this, endian);
}
