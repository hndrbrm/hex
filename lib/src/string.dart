// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'int.dart';

List<int> hexToInts8Big(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length.isEven);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 1;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0; i < intsLength; i++) {
    final int j = i << 1;
    final String byte = hex.substring(j, j + 2);
    final int int1 = int.parse(byte, radix: 16);
    result[i] = int1;
  }

  return result;
}
List<int> hexToInts16Big(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length % 4 == 0);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 2;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0; i < intsLength; i++) {
    final int j = i << 2;
    final String byte = hex.substring(j, j + 4);
    final int int1 = int.parse(byte, radix: 16);
    result[i] = int1;
  }

  return result;
}
List<int> hexToInts32Big(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length % 8 == 0);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 3;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0; i < intsLength; i++) {
    final int j = i << 3;
    final String byte = hex.substring(j, j + 8);
    final int int1 = int.parse(byte, radix: 16);
    result[i] = int1;
  }

  return result;
}
List<int> hexToInts64Big(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length % 16 == 0);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 4;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0; i < intsLength; i++) {
    final int j = i << 4;
    final String byte = hex.substring(j, j + 16);
    final int int1 = hexToInt64Big(byte);
    result[i] = int1;
  }

  return result;
}

List<int> hexToInts8Little(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length.isEven);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 1;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0, j = hexLength; i < intsLength; i++) {
    final int a = j - 2;
    final String byte = hex.substring(a, j);
    final int int1 = int.parse(byte, radix: 16);
    result[i] = int1;
    j = a;
  }

  return result;
}
List<int> hexToInts16Little(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length % 4 == 0);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 2;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0, j = hexLength; i < intsLength; i++) {
    final StringBuffer sb = StringBuffer();

    final int a = j - 2;
    sb.write(hex.substring(a, j));
    final int aa = a - 2;
    sb.write(hex.substring(aa, a));

    result[i] = int.parse(sb.toString(), radix: 16);
    j = aa;
  }

  return result;
}
List<int> hexToInts32Little(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length % 8 == 0);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 3;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0, j = hexLength; i < intsLength; i++) {
    final StringBuffer sb = StringBuffer();

    int a = j - 2;
    sb.write(hex.substring(a, j));
    int aa = a - 2;
    sb.write(hex.substring(aa, a));
    a = aa - 2;
    sb.write(hex.substring(a, aa));
    aa = a - 2;
    sb.write(hex.substring(aa, a));

    result[i] = int.parse(sb.toString(), radix: 16);
    j = aa;
  }

  return result;
}
List<int> hexToInts64Little(String hex) {
  assert(hex.isNotEmpty);
  assert(hex.length % 16 == 0);

  final int hexLength = hex.length;
  final int intsLength = hexLength >>> 4;

  final List<int> result = List<int>.filled(intsLength, 0);

  for (int i = 0, j = hexLength; i < intsLength; i++) {
    final StringBuffer sb = StringBuffer();

    int a = j - 2;
    sb.write(hex.substring(a, j));
    int aa = a - 2;
    sb.write(hex.substring(aa, a));
    a = aa - 2;
    sb.write(hex.substring(a, aa));
    aa = a - 2;
    sb.write(hex.substring(aa, a));
    a = aa - 2;
    sb.write(hex.substring(a, aa));
    aa = a - 2;
    sb.write(hex.substring(aa, a));
    a = aa - 2;
    sb.write(hex.substring(a, aa));
    aa = a - 2;
    sb.write(hex.substring(aa, a));

    result[i] = hexToInt64Big(sb.toString());
    j = aa;
  }

  return result;
}

List<int> hexToInts8(String hex, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? hexToInts8Big(hex)
    : hexToInts8Little(hex);
}
List<int> hexToInts16(String hex, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? hexToInts16Big(hex)
    : hexToInts16Little(hex);
}
List<int> hexToInts32(String hex, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? hexToInts32Big(hex)
    : hexToInts32Little(hex);
}
List<int> hexToInts64(String hex, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? hexToInts64Big(hex)
    : hexToInts64Little(hex);
}
