// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'int.dart';

String byteDataToHexBig(ByteData data) {
  final StringBuffer result = StringBuffer();

  final int length = data.lengthInBytes;
  int index = 0;

  while (index <= length - 8) {
    final int byte = data.getUint64(index, Endian.big);
    result.write(int64ToHexBig(byte));
    index += 8;
  }

  if (index <= length - 4) {
    final int byte = data.getUint32(index, Endian.big);
    result.write(byte.toRadixString(16).padLeft(8, '0'));
    index += 4;
  }

  if (index <= length - 2) {
    final int byte = data.getUint16(index, Endian.big);
    result.write(byte.toRadixString(16).padLeft(4, '0'));
    index += 2;
  }

  if (index == length - 1) {
    final int byte = data.getUint8(index);
    result.write(byte.toRadixString(16).padLeft(2, '0'));
  }

  return result.toString();
}
String byteDataToHexLittle(ByteData data) {
  final StringBuffer result = StringBuffer();

  int index = data.lengthInBytes;

  while (index >= 8) {
    index -= 8;
    final int byte = data.getUint64(index, Endian.little);
    result.write(int64ToHexBig(byte));
  }

  if (index >= 4) {
    index -= 4;
    final int byte = data.getUint32(index, Endian.little);
    result.write(byte.toRadixString(16).padLeft(8, '0'));
  }

  if (index >= 2) {
    index -= 2;
    final int byte = data.getUint16(index, Endian.little);
    result.write(byte.toRadixString(16).padLeft(4, '0'));
  }

  if (index == 1) {
    final int byte = data.getUint8(0);
    result.write(byte.toRadixString(16).padLeft(2, '0'));
  }

  return result.toString();
}
String byteDataToHex(ByteData data, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? byteDataToHexBig(data)
    : byteDataToHexLittle(data);
}

String bytes8ToHexBig(Uint8List bytes) {
  final ByteData data = bytes.buffer.asByteData();
  return byteDataToHexBig(data);
}
String bytes16ToHexBig(Uint16List bytes) {
  final StringBuffer result = StringBuffer();

  for (int i = 0; i < bytes.length; i++) {
    final int byte = bytes[i];
    result.write(byte.toRadixString(16).padLeft(4, '0'));
  }

  return result.toString();
}
String bytes32ToHexBig(Uint32List bytes) {
  final StringBuffer result = StringBuffer();

  for (int i = 0; i < bytes.length; i++) {
    final int byte = bytes[i];
    result.write(byte.toRadixString(16).padLeft(8, '0'));
  }

  return result.toString();
}
String bytes64ToHexBig(Uint64List bytes) {
  final StringBuffer result = StringBuffer();

  for (int i = 0; i < bytes.length; i++) {
    final int byte = bytes[i];
    result.write(byte.asInt64ToHexBig());
  }

  return result.toString();
}

String bytes8ToHexLittle(Uint8List bytes) {
  final ByteData data = bytes.buffer.asByteData();
  return byteDataToHexLittle(data);
}
String bytes16ToHexLittle(Uint16List bytes) {
  final StringBuffer result = StringBuffer();

  for (int i = bytes.length - 1; i >= 0; i--) {
    final int byte = bytes[i];
    result.write(byte.asInt16ToHexLittle());
  }

  return result.toString();
}
String bytes32ToHexLittle(Uint32List bytes) {
  final StringBuffer result = StringBuffer();

  for (int i = bytes.length - 1; i >= 0; i--) {
    final int byte = bytes[i];
    result.write(byte.asInt32ToHexLittle());
  }

  return result.toString();
}
String bytes64ToHexLittle(Uint64List bytes) {
  final StringBuffer result = StringBuffer();

  for (int i = bytes.length - 1; i >= 0; i--) {
    final int byte = bytes[i];
    result.write(byte.asInt64ToHexLittle());
  }

  return result.toString();
}

String bytes8ToHex(Uint8List bytes, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? bytes8ToHexBig(bytes)
    : bytes8ToHexLittle(bytes);
}
String bytes16ToHex(Uint16List bytes, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? bytes16ToHexBig(bytes)
    : bytes16ToHexLittle(bytes);
}
String bytes32ToHex(Uint32List bytes, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? bytes32ToHexBig(bytes)
    : bytes32ToHexLittle(bytes);
}
String bytes64ToHex(Uint64List bytes, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? bytes64ToHexBig(bytes)
    : bytes64ToHexLittle(bytes);
}

String ints8ToHexBig(List<int> ints) {
  final ByteData data = Uint8List.fromList(ints).buffer.asByteData();
  return byteDataToHexBig(data);
}
String ints16ToHexBig(List<int> ints) {
  final Uint16List bytes = Uint16List.fromList(ints);
  return bytes16ToHexBig(bytes);
}
String ints32ToHexBig(List<int> ints) {
  final Uint32List bytes = Uint32List.fromList(ints);
  return bytes32ToHexBig(bytes);
}
String ints64ToHexBig(List<int> ints) {
  final Uint64List bytes = Uint64List.fromList(ints);
  return bytes64ToHexBig(bytes);
}

String ints8ToHexLittle(List<int> ints) {
  final ByteData data = Uint8List.fromList(ints).buffer.asByteData();
  return byteDataToHexLittle(data);
}
String ints16ToHexLittle(List<int> ints) {
  final Uint16List bytes = Uint16List.fromList(ints);
  return bytes16ToHexLittle(bytes);
}
String ints32ToHexLittle(List<int> ints) {
  final Uint32List bytes = Uint32List.fromList(ints);
  return bytes32ToHexLittle(bytes);
}
String ints64ToHexLittle(List<int> ints) {
  final Uint64List bytes = Uint64List.fromList(ints);
  return bytes64ToHexLittle(bytes);
}

String ints8ToHex(List<int> ints, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? ints8ToHexBig(ints)
    : ints8ToHexLittle(ints);
}
String ints16ToHex(List<int> ints, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? ints16ToHexBig(ints)
    : ints16ToHexLittle(ints);
}
String ints32ToHex(List<int> ints, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? ints32ToHexBig(ints)
    : ints32ToHexLittle(ints);
}
String ints64ToHex(List<int> ints, [ Endian endian = Endian.big ]) {
  return endian == Endian.big
    ? ints64ToHexBig(ints)
    : ints64ToHexLittle(ints);
}

extension ByteDataToHexExtension on ByteData {
  String toHexBig() => byteDataToHexBig(this);
  String toHexLittle() => byteDataToHexLittle(this);
  String toHex([ Endian endian = Endian.big ]) => byteDataToHex(this, endian);
}

extension Bytes8ToHexExtension on Uint8List {
  String asBytes8ToHexBig() => bytes8ToHexBig(this);
  String asBytes8ToHexLittle() => bytes8ToHexLittle(this);
  String asBytes8ToHex([ Endian endian = Endian.big ]) => bytes8ToHex(this, endian);
}
extension Bytes16ToHexExtension on Uint16List {
  String asBytes16ToHexBig() => bytes16ToHexBig(this);
  String asBytes16ToHexLittle() => bytes16ToHexLittle(this);
  String asBytes16ToHex([ Endian endian = Endian.big ]) => bytes16ToHex(this, endian);
}
extension Bytes32ToHexExtension on Uint32List {
  String asBytes32ToHexBig() => bytes32ToHexBig(this);
  String asBytes32ToHexLittle() => bytes32ToHexLittle(this);
  String asBytes32ToHex([ Endian endian = Endian.big ]) => bytes32ToHex(this, endian);
}
extension Bytes64ToHexExtension on Uint64List {
  String asBytes64ToHexBig() => bytes64ToHexBig(this);
  String asBytes64ToHexLittle() => bytes64ToHexLittle(this);
  String asBytes64ToHex([ Endian endian = Endian.big ]) => bytes64ToHex(this, endian);
}

extension IntsToHexExtension on List<int> {
  String asInts8ToHexBig() => ints8ToHexBig(this);
  String asInts16ToHexBig() => ints16ToHexBig(this);
  String asInts32ToHexBig() => ints32ToHexBig(this);
  String asInts64ToHexBig() => ints64ToHexBig(this);

  String asInts8ToHexLittle() => ints8ToHexLittle(this);
  String asInts16ToHexLittle() => ints16ToHexLittle(this);
  String asInts32ToHexLittle() => ints32ToHexLittle(this);
  String asInts64ToHexLittle() => ints64ToHexLittle(this);

  String asInts8ToHex([ Endian endian = Endian.big ]) => ints8ToHex(this, endian);
  String asInts16ToHex([ Endian endian = Endian.big ]) => ints16ToHex(this, endian);
  String asInts32ToHex([ Endian endian = Endian.big ]) => ints32ToHex(this, endian);
  String asInts64ToHex([ Endian endian = Endian.big ]) => ints64ToHex(this, endian);
}
