// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'int.dart';

BigInt mask8 = BigInt.parse('ff', radix: 16);
BigInt mask32 = BigInt.parse('ffffffff', radix: 16);
BigInt mask64 = BigInt.parse('ffffffffffffffff', radix: 16);
BigInt mask128 = BigInt.parse('ffffffffffffffffffffffffffffffff', radix: 16);

String bigInt8ToHex(BigInt bigInt8) {
  assert((bigInt8 | mask8) == mask8);

  return bigInt8.toInt().asInt8ToHex();
}

String bigInt64ToHexBig(BigInt bigInt64) {
  assert((bigInt64 | mask64) == mask64);

  return
    '${int32ToHexBig((bigInt64 >> 32).toInt())}'
    '${int32ToHexBig((bigInt64 & mask32).toInt())}';
}
String bigInt128ToHexBig(BigInt bigInt128) {
  assert((bigInt128 | mask128) == mask128);

  return
    '${bigInt64ToHexBig(bigInt128 >> 64)}'
    '${bigInt64ToHexBig(bigInt128 & mask64)}';
}

String bigInt64ToHexLittle(BigInt bigInt64) {
  assert((bigInt64 | mask64) == mask64);

  return
    '${int32ToHexLittle((bigInt64 & mask32).toInt())}'
    '${int32ToHexLittle((bigInt64 >> 32).toInt())}';
}
String bigInt128ToHexLittle(BigInt bigInt128) {
  assert((bigInt128 | mask128) == mask128);

  return
    '${bigInt64ToHexLittle(bigInt128 & mask64)}'
    '${bigInt64ToHexLittle(bigInt128 >> 64)}';
}

String bigInt64ToHex(BigInt bigInt64, [ Endian endian = Endian.big ]) {
  assert((bigInt64 | mask64) == mask64);

  return endian == Endian.big
    ? bigInt64ToHexBig(bigInt64)
    : bigInt64ToHexLittle(bigInt64);
}
String bigInt128ToHex(BigInt bigInt128, [ Endian endian = Endian.big ]) {
  assert((bigInt128 | mask128) == mask128);

  return endian == Endian.big
    ? bigInt128ToHexBig(bigInt128)
    : bigInt128ToHexLittle(bigInt128);
}

BigInt hexToBigInt8(String hex) {
  assert(hex.length <= 2);

  return BigInt.parse(hex, radix: 16);
}

BigInt hexToBigInt64Big(String hex) {
  assert(hex.length == 16);

  return BigInt.parse(hex, radix: 16);
}
BigInt hexToBigInt128Big(String hex) {
  assert(hex.length == 32);

  return BigInt.parse(hex, radix: 16);
}

BigInt hexToBigInt64Little(String hex) {
  assert(hex.length == 16);

  final BigInt a = BigInt.parse(hex, radix: 16);
  return
    (a & BigInt.parse('00000000000000ff', radix: 16)) << 56 |
    (a & BigInt.parse('000000000000ff00', radix: 16)) << 40 |
    (a & BigInt.parse('0000000000ff0000', radix: 16)) << 24 |
    (a & BigInt.parse('00000000ff000000', radix: 16)) << 8 |
    (a & BigInt.parse('000000ff00000000', radix: 16)) >> 8 |
    (a & BigInt.parse('0000ff0000000000', radix: 16)) >> 24 |
    (a & BigInt.parse('00ff000000000000', radix: 16)) >> 40 |
    (a >> 56);
}
BigInt hexToBigInt128Little(String hex) {
  assert(hex.length == 32);

  final BigInt a = BigInt.parse(hex, radix: 16);
  return
    (a & BigInt.parse('000000000000000000000000000000ff', radix: 16)) << 120 |
    (a & BigInt.parse('0000000000000000000000000000ff00', radix: 16)) << 104 |
    (a & BigInt.parse('00000000000000000000000000ff0000', radix: 16)) << 88 |
    (a & BigInt.parse('000000000000000000000000ff000000', radix: 16)) << 72 |
    (a & BigInt.parse('0000000000000000000000ff00000000', radix: 16)) << 56 |
    (a & BigInt.parse('00000000000000000000ff0000000000', radix: 16)) << 40 |
    (a & BigInt.parse('000000000000000000ff000000000000', radix: 16)) << 24 |
    (a & BigInt.parse('0000000000000000ff00000000000000', radix: 16)) << 8 |
    (a & BigInt.parse('00000000000000ff0000000000000000', radix: 16)) >> 8 |
    (a & BigInt.parse('000000000000ff000000000000000000', radix: 16)) >> 24 |
    (a & BigInt.parse('0000000000ff00000000000000000000', radix: 16)) >> 40 |
    (a & BigInt.parse('00000000ff0000000000000000000000', radix: 16)) >> 56 |
    (a & BigInt.parse('000000ff000000000000000000000000', radix: 16)) >> 72 |
    (a & BigInt.parse('0000ff00000000000000000000000000', radix: 16)) >> 88 |
    (a & BigInt.parse('00ff0000000000000000000000000000', radix: 16)) >> 104 |
    (a >> 120);
}

BigInt hexToBigInt64(String hex, [ Endian endian = Endian.big ]) {
  assert(hex.length == 16);

  return endian == Endian.big
    ? hexToBigInt64Big(hex)
    : hexToBigInt64Little(hex);
}
BigInt hexToBigInt128(String hex, [ Endian endian = Endian.big ]) {
  assert(hex.length == 32);

  return endian == Endian.big
    ? hexToBigInt128Big(hex)
    : hexToBigInt128Little(hex);
}

extension BigIntToHexExtension on BigInt {
  String asBigInt8ToHex() => bigInt8ToHex(this);

  String asBigInt64ToHexBig() => bigInt64ToHexBig(this);
  String asBigInt128ToHexBig() => bigInt128ToHexBig(this);

  String asBigInt64ToHexLittle() => bigInt64ToHexLittle(this);
  String asBigInt128ToHexLittle() => bigInt128ToHexLittle(this);

  String asBigInt64ToHex([ Endian endian = Endian.big ]) => bigInt64ToHex(this, endian);
  String asBigInt128ToHex([ Endian endian = Endian.big ]) => bigInt128ToHex(this, endian);
}

extension HexToBigIntExtension on String {
  BigInt asHexToBigInt8() => hexToBigInt8(this);

  BigInt asHexToBigInt64Big() => hexToBigInt64Big(this);
  BigInt asHexToBigInt128Big() => hexToBigInt128Big(this);

  BigInt asHexToBigInt64Little() => hexToBigInt64Little(this);
  BigInt asHexToBigInt128Little() => hexToBigInt128Little(this);

  BigInt asHexToBigInt64([ Endian endian = Endian.big ]) => hexToBigInt64(this, endian);
  BigInt asHexToBigInt128([ Endian endian = Endian.big ]) => hexToBigInt128(this, endian);
}
