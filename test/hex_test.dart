// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:hex/hex.dart';
import 'package:test/test.dart';

void main() {
  group('A group of bigint tests', () {
    test('bigInt8ToHex', () {
      expect(bigInt8ToHex(BigInt.from(0x10)), '10');
      expect(bigInt8ToHex(BigInt.from(0x01)), '01');
    });

    test('bigInt64ToHexBig', () {
      expect(
        bigInt64ToHexBig(BigInt.parse('1020304050607080', radix: 16)),
        '1020304050607080',
      );
      expect(
        bigInt64ToHexBig(BigInt.parse('102030405060708', radix: 16)),
        '0102030405060708',
      );
    });
    test('bigInt128ToHexBig', () {
      expect(
        bigInt128ToHexBig(BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16)),
        '102030405060708090a0b0c0d0e0f000',
      );
      expect(
        bigInt128ToHexBig(BigInt.parse('102030405060708090a0b0c0d0e0f00', radix: 16)),
        '0102030405060708090a0b0c0d0e0f00',
      );
    });

    test('bigInt64ToHexLittle', () {
      expect(
        bigInt64ToHexLittle(BigInt.parse('1020304050607080', radix: 16)),
        '8070605040302010',
      );
      expect(
        bigInt64ToHexLittle(BigInt.parse('102030405060708', radix: 16)),
        '0807060504030201',
      );
    });
    test('bigInt128ToHexLittle', () {
      expect(
        bigInt128ToHexLittle(BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16)),
        '00f0e0d0c0b0a0908070605040302010',
      );
      expect(
        bigInt128ToHexLittle(BigInt.parse('102030405060708090a0b0c0d0e0f00', radix: 16)),
        '000f0e0d0c0b0a090807060504030201',
      );
    });

    test('bigInt64ToHex', () {
      expect(
        bigInt64ToHex(BigInt.parse('1020304050607080', radix: 16), Endian.big),
        '1020304050607080',
      );
      expect(
        bigInt64ToHex(BigInt.parse('1020304050607080', radix: 16), Endian.little),
        '8070605040302010',
      );
    });
    test('bigInt128ToHex', () {
      expect(
        bigInt128ToHex(BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16), Endian.big),
        '102030405060708090a0b0c0d0e0f000',
      );
      expect(
        bigInt128ToHex(BigInt.parse('102030405060708090a0b0c0d0e0f00', radix: 16), Endian.little),
        '000f0e0d0c0b0a090807060504030201',
      );
    });

    test('hexToBigInt8', () {
      expect(hexToBigInt8('10'), BigInt.from(0x10));
      expect(hexToBigInt8('01'), BigInt.from(0x01));
    });

    test('hexToBigInt64Big', () {
      expect(
        hexToBigInt64Big('1020304050607080'),
        BigInt.parse('1020304050607080', radix: 16),
      );
      expect(
        hexToBigInt64Big('0102030405060708'),
        BigInt.parse('0102030405060708', radix: 16),
      );
    });
    test('hexToBigInt128Big', () {
      expect(
        hexToBigInt128Big('102030405060708090a0b0c0d0e0f000'),
        BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16),
      );
      expect(
        hexToBigInt128Big('0102030405060708090a0b0c0d0e0f00'),
        BigInt.parse('0102030405060708090a0b0c0d0e0f00', radix: 16),
      );
    });

    test('hexToBigInt64Little', () {
      expect(
        hexToBigInt64Little('8070605040302010'),
        BigInt.parse('1020304050607080', radix: 16),
      );
      expect(
        hexToBigInt64Little('0807060504030201'),
        BigInt.parse('0102030405060708', radix: 16),
      );
    });
    test('hexToBigInt128Little', () {
      expect(
        hexToBigInt128Little('00f0e0d0c0b0a0908070605040302010'),
        BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16),
      );
      expect(
        hexToBigInt128Little('000f0e0d0c0b0a090807060504030201'),
        BigInt.parse('0102030405060708090a0b0c0d0e0f00', radix: 16),
      );
    });

    test('hexToBigInt64', () {
      expect(
        hexToBigInt64('8070605040302010', Endian.big),
        BigInt.parse('8070605040302010', radix: 16),
      );
      expect(
        hexToBigInt64('8070605040302010', Endian.little),
        BigInt.parse('1020304050607080', radix: 16),
      );
    });
    test('hexToBigInt128', () {
      expect(
        hexToBigInt128('00f0e0d0c0b0a0908070605040302010', Endian.big),
        BigInt.parse('00f0e0d0c0b0a0908070605040302010', radix: 16),
      );
      expect(
        hexToBigInt128('000f0e0d0c0b0a090807060504030201', Endian.little),
        BigInt.parse('0102030405060708090a0b0c0d0e0f00', radix: 16),
      );
    });
  });
  group('A group of bytes tests', () {
    test('byteDataToHexBig', () {
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00,
        ]).buffer.asByteData()),
        '00',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11,
        ]).buffer.asByteData()),
        '0011',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22,
        ]).buffer.asByteData()),
        '001122',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33,
        ]).buffer.asByteData()),
        '00112233',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44,
        ]).buffer.asByteData()),
        '0011223344',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55,
        ]).buffer.asByteData()),
        '001122334455',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
        ]).buffer.asByteData()),
        '00112233445566',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ]).buffer.asByteData()),
        '0011223344556677',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88,
        ]).buffer.asByteData()),
        '0011223344556677'
        '88',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aa',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aabb',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aabbcc',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aabbccdd',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aabbccddee',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aabbccddeeff',
      );
      expect(
        byteDataToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
          0x00,
        ]).buffer.asByteData()),
        '0011223344556677'
        '8899aabbccddeeff'
        '00',
      );
    });
    test('byteDataToHexLittle', () {
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00,
        ]).buffer.asByteData()),
        '00',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11,
        ]).buffer.asByteData()),
        '1100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22,
        ]).buffer.asByteData()),
        '221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33,
        ]).buffer.asByteData()),
        '33221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44,
        ]).buffer.asByteData()),
        '4433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55,
        ]).buffer.asByteData()),
        '554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
        ]).buffer.asByteData()),
        '66554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ]).buffer.asByteData()),
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88,
        ]).buffer.asByteData()),
        '88'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99,
        ]).buffer.asByteData()),
        '9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa,
        ]).buffer.asByteData()),
        'aa9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb,
        ]).buffer.asByteData()),
        'bbaa9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc,
        ]).buffer.asByteData()),
        'ccbbaa9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
        ]).buffer.asByteData()),
        'ddccbbaa9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
        ]).buffer.asByteData()),
        'eeddccbbaa9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ]).buffer.asByteData()),
        'ffeeddccbbaa9988'
        '7766554433221100',
      );
      expect(
        byteDataToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
          0x00,
        ]).buffer.asByteData()),
        '00'
        'ffeeddccbbaa9988'
        '7766554433221100',
      );
    });
    test('byteDataToHex', () {
      expect(
        byteDataToHex(Uint8List.fromList(<int>[
          0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
        ]).buffer.asByteData(), Endian.big),
        '1122334455667788',
      );
      expect(
        byteDataToHex(Uint8List.fromList(<int>[
          0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
        ]).buffer.asByteData(), Endian.little),
        '8877665544332211',
      );
    });

    test('bytes8ToHexBig', () {
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00,
        ])),
        '00',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11,
        ])),
        '0011',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22,
        ])),
        '001122',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33,
        ])),
        '00112233',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44,
        ])),
        '0011223344',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55,
        ])),
        '001122334455',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
        ])),
        '00112233445566',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ])),
        '0011223344556677',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88,
        ])),
        '0011223344556677'
        '88',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99,
        ])),
        '0011223344556677'
        '8899',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa,
        ])),
        '0011223344556677'
        '8899aa',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb,
        ])),
        '0011223344556677'
        '8899aabb',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc,
        ])),
        '0011223344556677'
        '8899aabbcc',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
        ])),
        '0011223344556677'
        '8899aabbccdd',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
        ])),
        '0011223344556677'
        '8899aabbccddee',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ])),
        '0011223344556677'
        '8899aabbccddeeff',
      );
      expect(
        bytes8ToHexBig(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
          0x00,
        ])),
        '0011223344556677'
        '8899aabbccddeeff'
        '00',
      );
    });
    test('bytes16ToHexBig', () {
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011,
        ])),
        '0011',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122,
        ])),
        '00111122',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233,
        ])),
        '001111222233',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344,
        ])),
        '0011112222333344',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455,
        ])),
        '00111122223333444455',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566,
        ])),
        '001111222233334444555566',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677,
        ])),
        '0011112222333344445555666677',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
        ])),
        '00111122223333444455556666777788',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899,
        ])),
        '00111122223333444455556666777788'
        '8899',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa,
        ])),
        '00111122223333444455556666777788'
        '889999aa',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabb',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabbbbcc',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabbbbccccdd',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabbbbccccddddee',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee, 0xeeff,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabbbbccccddddeeeeff',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee, 0xeeff, 0xff00,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabbbbccccddddeeeeffff00',
      );
      expect(
        bytes16ToHexBig(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee, 0xeeff, 0xff00,
          0x0011,
        ])),
        '00111122223333444455556666777788'
        '889999aaaabbbbccccddddeeeeffff00'
        '0011',
      );
    });
    test('bytes32ToHexBig', () {
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111,
        ])),
        '00001111',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222,
        ])),
        '0000111111112222',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333,
        ])),
        '000011111111222222223333',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444,
        ])),
        '00001111111122222222333333334444',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555,
        ])),
        '0000111111112222222233333333444444445555',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666,
        ])),
        '000011111111222222223333333344444444555555556666',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777,
        ])),
        '00001111111122222222333333334444444455555555666666667777',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '88889999',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaa',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbb',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbbbbbbcccc',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbbbbbbccccccccdddd',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbbbbbbccccccccddddddddeeee',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee, 0xeeeeffff,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffff',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee, 0xeeeeffff, 0xffff0000,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff0000',
      );
      expect(
        bytes32ToHexBig(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee, 0xeeeeffff, 0xffff0000,
          0x00001111,
        ])),
        '0000111111112222222233333333444444445555555566666666777777778888'
        '888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff0000'
        '00001111',
      );
    });
    test('bytes64ToHexBig', () {
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111,
        ])),
        '0000000011111111',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222,
        ])),
        '00000000111111111111111122222222',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333,
        ])),
        '000000001111111111111111222222222222222233333333',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '44444444555555555555555566666666',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '444444445555555555555555666666666666666677777777',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '8888888899999999',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaa',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbb',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbcccccccc',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbcccccccc'
        'ccccccccdddddddd',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbcccccccc'
        'ccccccccddddddddddddddddeeeeeeee',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee, 0xeeeeeeeeffffffff,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbcccccccc'
        'ccccccccddddddddddddddddeeeeeeeeeeeeeeeeffffffff',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee, 0xeeeeeeeeffffffff, 0xffffffff00000000,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbcccccccc'
        'ccccccccddddddddddddddddeeeeeeeeeeeeeeeeffffffffffffffff00000000',
      );
      expect(
        bytes64ToHexBig(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee, 0xeeeeeeeeffffffff, 0xffffffff00000000,
          0x0000000011111111,
        ])),
        '0000000011111111111111112222222222222222333333333333333344444444'
        '4444444455555555555555556666666666666666777777777777777788888888'
        '888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbcccccccc'
        'ccccccccddddddddddddddddeeeeeeeeeeeeeeeeffffffffffffffff00000000'
        '0000000011111111',
      );
    });

    test('bytes8ToHexLittle', () {
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00,
        ])),
        '00',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11,
        ])),
        '1100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22,
        ])),
        '221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33,
        ])),
        '33221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44
        ])),
        '4433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55
        ])),
        '554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66
        ])),
        '66554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77
        ])),
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88,
        ])),
        '88'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99,
        ])),
        '9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa,
        ])),
        'aa9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb,
        ])),
        'bbaa9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc,
        ])),
        'ccbbaa9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
        ])),
        'ddccbbaa9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
        ])),
        'eeddccbbaa9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ])),
        'ffeeddccbbaa9988'
        '7766554433221100',
      );
      expect(
        bytes8ToHexLittle(Uint8List.fromList(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
          0x00,
        ])),
        '00'
        'ffeeddccbbaa9988'
        '7766554433221100',
      );
    });
    test('bytes16ToHexLittle', () {
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011,
        ])),
        '1100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122,
        ])),
        '22111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233,
        ])),
        '332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344,
        ])),
        '4433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455,
        ])),
        '55444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566,
        ])),
        '665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677,
        ])),
        '7766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
        ])),
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899,
        ])),
        '9988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa,
        ])),
        'aa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb,
        ])),
        'bbaaaa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc,
        ])),
        'ccbbbbaaaa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd,
        ])),
        'ddccccbbbbaaaa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee,
        ])),
        'eeddddccccbbbbaaaa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee, 0xeeff,
        ])),
        'ffeeeeddddccccbbbbaaaa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee, 0xeeff, 0xff00,
        ])),
        '00ffffeeeeddddccccbbbbaaaa999988'
        '88777766665555444433332222111100',
      );
      expect(
        bytes16ToHexLittle(Uint16List.fromList(<int>[
          0x0011, 0x1122, 0x2233, 0x3344, 0x4455, 0x5566, 0x6677, 0x7788,
          0x8899, 0x99aa, 0xaabb, 0xbbcc, 0xccdd, 0xddee, 0xeeff, 0xff00,
          0x0011,
        ])),
        '1100'
        '00ffffeeeeddddccccbbbbaaaa999988'
        '88777766665555444433332222111100',
      );
    });
    test('bytes32ToHexLittle', () {
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111,
        ])),
        '11110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222,
        ])),
        '2222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333,
        ])),
        '333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444,
        ])),
        '44443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555,
        ])),
        '5555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666,
        ])),
        '666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777,
        ])),
        '77776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
        ])),
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999,
        ])),
        '99998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa,
        ])),
        'aaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb,
        ])),
        'bbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc,
        ])),
        'ccccbbbbbbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd,
        ])),
        'ddddccccccccbbbbbbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee,
        ])),
        'eeeeddddddddccccccccbbbbbbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee, 0xeeeeffff,
        ])),
        'ffffeeeeeeeeddddddddccccccccbbbbbbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee, 0xeeeeffff, 0xffff0000,
        ])),
        '0000ffffffffeeeeeeeeddddddddccccccccbbbbbbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
      expect(
        bytes32ToHexLittle(Uint32List.fromList(<int>[
          0x00001111, 0x11112222, 0x22223333, 0x33334444, 0x44445555, 0x55556666, 0x66667777, 0x77778888,
          0x88889999, 0x9999aaaa, 0xaaaabbbb, 0xbbbbcccc, 0xccccdddd, 0xddddeeee, 0xeeeeffff, 0xffff0000,
          0x00001111,
        ])),
        '11110000'
        '0000ffffffffeeeeeeeeddddddddccccccccbbbbbbbbaaaaaaaa999999998888'
        '8888777777776666666655555555444444443333333322222222111111110000',
      );
    });
    test('bytes64ToHexLittle', () {
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111,
        ])),
        '1111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222,
        ])),
        '22222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333,
        ])),
        '333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
        ])),
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555,
        ])),
        '5555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666,
        ])),
        '66666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777,
        ])),
        '777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
        ])),
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999,
        ])),
        '9999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa,
        ])),
        'aaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb,
        ])),
        'bbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
        ])),
        'ccccccccbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd,
        ])),
        'ddddddddcccccccc'
        'ccccccccbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee,
        ])),
        'eeeeeeeeddddddddddddddddcccccccc'
        'ccccccccbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee, 0xeeeeeeeeffffffff,
        ])),
        'ffffffffeeeeeeeeeeeeeeeeddddddddddddddddcccccccc'
        'ccccccccbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee, 0xeeeeeeeeffffffff, 0xffffffff00000000,
        ])),
        '00000000ffffffffffffffffeeeeeeeeeeeeeeeeddddddddddddddddcccccccc'
        'ccccccccbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
      expect(
        bytes64ToHexLittle(Uint64List.fromList(<int>[
          0x0000000011111111, 0x1111111122222222, 0x2222222233333333, 0x3333333344444444,
          0x4444444455555555, 0x5555555566666666, 0x6666666677777777, 0x7777777788888888,
          0x8888888899999999, 0x99999999aaaaaaaa, 0xaaaaaaaabbbbbbbb, 0xbbbbbbbbcccccccc,
          0xccccccccdddddddd, 0xddddddddeeeeeeee, 0xeeeeeeeeffffffff, 0xffffffff00000000,
          0x0000000011111111,
        ])),
        '1111111100000000'
        '00000000ffffffffffffffffeeeeeeeeeeeeeeeeddddddddddddddddcccccccc'
        'ccccccccbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa999999999999999988888888'
        '8888888877777777777777776666666666666666555555555555555544444444'
        '4444444433333333333333332222222222222222111111111111111100000000',
      );
    });

    test('bytes8ToHex', () {
      expect(
        bytes8ToHex(Uint8List.fromList(<int>[ 0x11, 0x22 ]), Endian.big),
        '1122',
      );
      expect(
        bytes8ToHex(Uint8List.fromList(<int>[ 0x11, 0x22 ]), Endian.little),
        '2211',
      );
    });
    test('bytes16ToHex', () {
      expect(
        bytes16ToHex(Uint16List.fromList(<int>[ 0x1111, 0x2222 ]), Endian.big),
        '11112222',
      );
      expect(
        bytes16ToHex(Uint16List.fromList(<int>[ 0x1111, 0x2222 ]), Endian.little),
        '22221111',
      );
    });
    test('bytes32ToHex', () {
      expect(
        bytes32ToHex(Uint32List.fromList(<int>[ 0x11111111, 0x22222222 ]), Endian.big),
        '1111111122222222',
      );
      expect(
        bytes32ToHex(Uint32List.fromList(<int>[ 0x11111111, 0x22222222 ]), Endian.little),
        '2222222211111111',
      );
    });
    test('bytes64ToHex', () {
      expect(
        bytes64ToHex(Uint64List.fromList(<int>[ 0x1111111111111111, 0x2222222222222222 ]), Endian.big),
        '11111111111111112222222222222222',
      );
      expect(
        bytes64ToHex(Uint64List.fromList(<int>[ 0x1111111111111111, 0x2222222222222222 ]), Endian.little),
        '22222222222222221111111111111111',
      );
    });

    test('ints8ToHexBig', () {
      expect(
        ints8ToHexBig(<int>[
          0x00,
        ]),
        '00',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11,
        ]),
        '0011',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22,
        ]),
        '001122',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33,
        ]),
        '00112233',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44,
        ]),
        '0011223344',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55,
        ]),
        '001122334455',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
        ]),
        '00112233445566',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ]),
        '0011223344556677',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88,
        ]),
        '0011223344556677'
        '88',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99,
        ]),
        '0011223344556677'
        '8899',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa,
        ]),
        '0011223344556677'
        '8899aa',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb,
        ]),
        '0011223344556677'
        '8899aabb',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc,
        ]),
        '0011223344556677'
        '8899aabbcc',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
        ]),
        '0011223344556677'
        '8899aabbccdd',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
        ]),
        '0011223344556677'
        '8899aabbccddee',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ]),
        '0011223344556677'
        '8899aabbccddeeff',
      );
      expect(
        ints8ToHexBig(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
          0x00,
        ]),
        '0011223344556677'
        '8899aabbccddeeff'
        '00',
      );
    });
    test('ints16ToHexBig', () {
      expect(
        ints16ToHexBig(<int>[
          0x0000,
        ]),
        '0000',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111,
        ]),
        '00001111',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222,
        ]),
        '000011112222',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333,
        ]),
        '0000111122223333',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444,
        ]),
        '00001111222233334444',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555,
        ]),
        '000011112222333344445555',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666,
        ]),
        '0000111122223333444455556666',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
        ]),
        '00001111222233334444555566667777',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888,
        ]),
        '00001111222233334444555566667777'
        '8888',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999,
        ]),
        '00001111222233334444555566667777'
        '88889999',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaa',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaabbbb',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaabbbbcccc',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaabbbbccccdddd',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd, 0xeeee,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaabbbbccccddddeeee',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd, 0xeeee, 0xffff,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaabbbbccccddddeeeeffff',
      );
      expect(
        ints16ToHexBig(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd, 0xeeee, 0xffff,
          0x0000,
        ]),
        '00001111222233334444555566667777'
        '88889999aaaabbbbccccddddeeeeffff'
        '0000',
      );
    });
    test('ints32ToHexBig', () {
      expect(
        ints32ToHexBig(<int>[
          0x00000000,
        ]),
        '00000000',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111,
        ]),
        '0000000011111111',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222,
        ]),
        '000000001111111122222222',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333,
        ]),
        '00000000111111112222222233333333',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444,
        ]),
        '0000000011111111222222223333333344444444',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555,
        ]),
        '000000001111111122222222333333334444444455555555',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666,
        ]),
        '00000000111111112222222233333333444444445555555566666666',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '88888888',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaa',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaabbbbbbbb',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaabbbbbbbbcccccccc',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaabbbbbbbbccccccccdddddddd',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd, 0xeeeeeeee,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeee',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd, 0xeeeeeeee, 0xffffffff,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff',
      );
      expect(
        ints32ToHexBig(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd, 0xeeeeeeee, 0xffffffff,
          0x00000000,
        ]),
        '0000000011111111222222223333333344444444555555556666666677777777'
        '8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff'
        '00000000',
      );
    });
    test('ints64ToHexBig', () {
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000,
        ]),
        '0000000000000000',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111,
        ]),
        '00000000000000001111111111111111',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222,
        ]),
        '000000000000000011111111111111112222222222222222',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '44444444444444445555555555555555',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '444444444444444455555555555555556666666666666666',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '8888888888888888',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaa',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb'
        'cccccccccccccccc',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb'
        'ccccccccccccccccdddddddddddddddd',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd, 0xeeeeeeeeeeeeeeee,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb'
        'ccccccccccccccccddddddddddddddddeeeeeeeeeeeeeeee',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd, 0xeeeeeeeeeeeeeeee, 0xffffffffffffffff,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb'
        'ccccccccccccccccddddddddddddddddeeeeeeeeeeeeeeeeffffffffffffffff',
      );
      expect(
        ints64ToHexBig(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd, 0xeeeeeeeeeeeeeeee, 0xffffffffffffffff,
          0x0000000000000000,
        ]),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777'
        '88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb'
        'ccccccccccccccccddddddddddddddddeeeeeeeeeeeeeeeeffffffffffffffff'
        '0000000000000000',
      );
    });

    test('ints8ToHexLittle', () {
      expect(
        ints8ToHexLittle(<int>[
          0x00,
        ]),
        '00',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11,
        ]),
        '1100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22,
        ]),
        '221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33,
        ]),
        '33221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44,
        ]),
        '4433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55,
        ]),
        '554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
        ]),
        '66554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ]),
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88,
        ]),
        '88'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99,
        ]),
        '9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa,
        ]),
        'aa9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb,
        ]),
        'bbaa9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc,
        ]),
        'ccbbaa9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd,
        ]),
        'ddccbbaa9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee,
        ]),
        'eeddccbbaa9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ]),
        'ffeeddccbbaa9988'
        '7766554433221100',
      );
      expect(
        ints8ToHexLittle(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
          0x00,
        ]),
        '00'
        'ffeeddccbbaa9988'
        '7766554433221100',
      );
    });
    test('ints16ToHexLittle', () {
      expect(
        ints16ToHexLittle(<int>[
          0x0000,
        ]),
        '0000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111,
        ]),
        '11110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222,
        ]),
        '222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333,
        ]),
        '3333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444,
        ]),
        '44443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555,
        ]),
        '555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666,
        ]),
        '6666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
        ]),
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888,
        ]),
        '8888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999,
        ]),
        '99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa,
        ]),
        'aaaa99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb,
        ]),
        'bbbbaaaa99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc,
        ]),
        'ccccbbbbaaaa99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd,
        ]),
        'ddddccccbbbbaaaa99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd, 0xeeee,
        ]),
        'eeeeddddccccbbbbaaaa99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd, 0xeeee, 0xffff,
        ]),
        'ffffeeeeddddccccbbbbaaaa99998888'
        '77776666555544443333222211110000',
      );
      expect(
        ints16ToHexLittle(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
          0x8888, 0x9999, 0xaaaa, 0xbbbb, 0xcccc, 0xdddd, 0xeeee, 0xffff,
          0x0000,
        ]),
        '0000'
        'ffffeeeeddddccccbbbbaaaa99998888'
        '77776666555544443333222211110000',
      );
    });
    test('ints32ToHexLittle', () {
      expect(
        ints32ToHexLittle(<int>[
          0x00000000,
        ]),
        '00000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111,
        ]),
        '1111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222,
        ]),
        '222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333,
        ]),
        '33333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444,
        ]),
        '4444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555,
        ]),
        '555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666,
        ]),
        '66666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
        ]),
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888,
        ]),
        '88888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999,
        ]),
        '9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa,
        ]),
        'aaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb,
        ]),
        'bbbbbbbbaaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc,
        ]),
        'ccccccccbbbbbbbbaaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd,
        ]),
        'ddddddddccccccccbbbbbbbbaaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd, 0xeeeeeeee,
        ]),
        'eeeeeeeeddddddddccccccccbbbbbbbbaaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd, 0xeeeeeeee, 0xffffffff,
        ]),
        'ffffffffeeeeeeeeddddddddccccccccbbbbbbbbaaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
      expect(
        ints32ToHexLittle(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
          0x88888888, 0x99999999, 0xaaaaaaaa, 0xbbbbbbbb, 0xcccccccc, 0xdddddddd, 0xeeeeeeee, 0xffffffff,
          0xaaaaaaaa,
        ]),
        'aaaaaaaa'
        'ffffffffeeeeeeeeddddddddccccccccbbbbbbbbaaaaaaaa9999999988888888'
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
    });
    test('ints64ToHexLittle', () {
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000,
        ]),
        '0000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111,
        ]),
        '11111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222,
        ]),
        '222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
        ]),
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444,
        ]),
        '4444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555,
        ]),
        '55555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666,
        ]),
        '666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
        ]),
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888,
        ]),
        '8888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999,
        ]),
        '99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa,
        ]),
        'aaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
        ]),
        'bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc,
        ]),
        'cccccccccccccccc'
        'bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd,
        ]),
        'ddddddddddddddddcccccccccccccccc'
        'bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd, 0xeeeeeeeeeeeeeeee,
        ]),
        'eeeeeeeeeeeeeeeeddddddddddddddddcccccccccccccccc'
        'bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd, 0xeeeeeeeeeeeeeeee, 0xffffffffffffffff,
        ]),
        'ffffffffffffffffeeeeeeeeeeeeeeeeddddddddddddddddcccccccccccccccc'
        'bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
      expect(
        ints64ToHexLittle(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
          0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa, 0xbbbbbbbbbbbbbbbb,
          0xcccccccccccccccc, 0xdddddddddddddddd, 0xeeeeeeeeeeeeeeee, 0xffffffffffffffff,
          0x0000000000000000,
        ]),
        '0000000000000000'
        'ffffffffffffffffeeeeeeeeeeeeeeeeddddddddddddddddcccccccccccccccc'
        'bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa99999999999999998888888888888888'
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
    });

    test('ints8ToHex', () {
      expect(
        ints8ToHex(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ], Endian.big),
        '0011223344556677',
      );
      expect(
        ints8ToHex(<int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        ], Endian.little),
        '7766554433221100',
      );
    });
    test('ints16ToHex', () {
      expect(
        ints16ToHex(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
        ], Endian.big),
        '00001111222233334444555566667777',
      );
      expect(
        ints16ToHex(<int>[
          0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777,
        ], Endian.little),
        '77776666555544443333222211110000',
      );
    });
    test('ints32ToHex', () {
      expect(
        ints32ToHex(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
        ], Endian.big),
        '0000000011111111222222223333333344444444555555556666666677777777',
      );
      expect(
        ints32ToHex(<int>[
          0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777,
        ], Endian.little),
        '7777777766666666555555554444444433333333222222221111111100000000',
      );
    });
    test('ints64ToHex', () {
      expect(
        ints64ToHex(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
        ], Endian.big),
        '0000000000000000111111111111111122222222222222223333333333333333'
        '4444444444444444555555555555555566666666666666667777777777777777',
      );
      expect(
        ints64ToHex(<int>[
          0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333,
          0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777,
        ], Endian.little),
        '7777777777777777666666666666666655555555555555554444444444444444'
        '3333333333333333222222222222222211111111111111110000000000000000',
      );
    });
  });
  group('A group of int tests', () {
    test('int8ToHex', () {
      expect(int8ToHex(0x10), '10');
      expect(int8ToHex(0x1), '01');
    });

    test('int16ToHexBig', () {
      expect(int16ToHexBig(0x1020), '1020');
      expect(int16ToHexBig(0x102), '0102');
    });
    test('int24ToHexBig', () {
      expect(int24ToHexBig(0x102030), '102030');
      expect(int24ToHexBig(0x10203), '010203');
    });
    test('int32ToHexBig', () {
      expect(int32ToHexBig(0x10203040), '10203040');
      expect(int32ToHexBig(0x1020304), '01020304');
    });
    test('int40ToHexBig', () {
      expect(int40ToHexBig(0x1020304050), '1020304050');
      expect(int40ToHexBig(0x102030405), '0102030405');
    });
    test('int48ToHexBig', () {
      expect(int48ToHexBig(0x102030405060), '102030405060');
      expect(int48ToHexBig(0x10203040506), '010203040506');
    });
    test('int56ToHexBig', () {
      expect(int56ToHexBig(0x10203040506070), '10203040506070');
      expect(int56ToHexBig(0x1020304050607), '01020304050607');
    });
    test('int64ToHexBig', () {
      expect(int64ToHexBig(0x1020304050607080), '1020304050607080');
      expect(int64ToHexBig(0x102030405060708), '0102030405060708');
    });

    test('int16ToHexLittle', () {
      expect(int16ToHexLittle(0x1020), '2010');
      expect(int16ToHexLittle(0x102), '0201');
    });
    test('int24ToHexLittle', () {
      expect(int24ToHexLittle(0x102030), '302010');
      expect(int24ToHexLittle(0x10203), '030201');
    });
    test('int32ToHexLittle', () {
      expect(int32ToHexLittle(0x10203040), '40302010');
      expect(int32ToHexLittle(0x1020304), '04030201');
    });
    test('int40ToHexLittle', () {
      expect(int40ToHexLittle(0x1020304050), '5040302010');
      expect(int40ToHexLittle(0x102030405), '0504030201');
    });
    test('int48ToHexLittle', () {
      expect(int48ToHexLittle(0x102030405060), '605040302010');
      expect(int48ToHexLittle(0x10203040506), '060504030201');
    });
    test('int56ToHexLittle', () {
      expect(int56ToHexLittle(0x10203040506070), '70605040302010');
      expect(int56ToHexLittle(0x1020304050607), '07060504030201');
    });
    test('int64ToHexLittle', () {
      expect(int64ToHexLittle(0x1020304050607080), '8070605040302010');
      expect(int64ToHexLittle(0x102030405060708), '0807060504030201');
    });

    test('intToHexBig', () {
      expect(intToHexBig(0x10), '10');
      expect(intToHexBig(0x1020), '1020');
      expect(intToHexBig(0x102030), '102030');
      expect(intToHexBig(0x10203040), '10203040');
      expect(intToHexBig(0x1020304050), '1020304050');
      expect(intToHexBig(0x102030405060), '102030405060');
      expect(intToHexBig(0x10203040506070), '10203040506070');
    });
    test('intToHexLittle', () {
      expect(intToHexLittle(0x10), '10');
      expect(intToHexLittle(0x1020), '2010');
      expect(intToHexLittle(0x102030), '302010');
      expect(intToHexLittle(0x10203040), '40302010');
      expect(intToHexLittle(0x1020304050), '5040302010');
      expect(intToHexLittle(0x102030405060), '605040302010');
      expect(intToHexLittle(0x10203040506070), '70605040302010');
    });
    test('intToHex', () {
      expect(intToHex(0x12345678, Endian.big), '12345678');
      expect(intToHex(0x12345678, Endian.little), '78563412');
    });

    test('hexToInt8', () {
      expect(hexToInt8('10'), 0x10);
      expect(hexToInt8('01'), 0x1);
      expect(hexToInt8('1'), 0x1);
    });

    test('hexToInt16Big', () {
      expect(hexToInt16Big('1020'), 0x1020);
      expect(hexToInt16Big('0102'), 0x102);
      expect(hexToInt16Big('102'), 0x102);
    });
    test('hexToInt24Big', () {
      expect(hexToInt24Big('102030'), 0x102030);
      expect(hexToInt24Big('010203'), 0x10203);
      expect(hexToInt24Big('10203'), 0x10203);
    });
    test('hexToInt32Big', () {
      expect(hexToInt32Big('10203040'), 0x10203040);
      expect(hexToInt32Big('01020304'), 0x1020304);
      expect(hexToInt32Big('1020304'), 0x1020304);
    });
    test('hexToInt40Big', () {
      expect(hexToInt40Big('1020304050'), 0x1020304050);
      expect(hexToInt40Big('0102030405'), 0x102030405);
      expect(hexToInt40Big('102030405'), 0x102030405);
    });
    test('hexToInt48Big', () {
      expect(hexToInt48Big('102030405060'), 0x102030405060);
      expect(hexToInt48Big('010203040506'), 0x10203040506);
      expect(hexToInt48Big('10203040506'), 0x10203040506);
    });
    test('hexToInt56Big', () {
      expect(hexToInt56Big('10203040506070'), 0x10203040506070);
      expect(hexToInt56Big('01020304050607'), 0x1020304050607);
      expect(hexToInt56Big('1020304050607'), 0x1020304050607);
    });
    test('hexToInt64Big', () {
      expect(hexToInt64Big('1020304050607080'), 0x1020304050607080);
      expect(hexToInt64Big('0102030405060708'), 0x102030405060708);
      expect(hexToInt64Big('102030405060708'), 0x102030405060708);
      expect(hexToInt64Big('ffeeddccbbaa9988'), 0xffeeddccbbaa9988);
      expect(hexToInt64Big('8899aabbccddeeff'), 0x8899aabbccddeeff);
    });

    test('hexToInt16Little', () {
      expect(hexToInt16Little('1020'), 0x2010);
      expect(hexToInt16Little('0102'), 0x201);
      expect(hexToInt16Little('102'), 0x201);
    });
    test('hexToInt24Little', () {
      expect(hexToInt24Little('102030'), 0x302010);
      expect(hexToInt24Little('010203'), 0x30201);
      expect(hexToInt24Little('10203'), 0x30201);
    });
    test('hexToInt32Little', () {
      expect(hexToInt32Little('10203040'), 0x40302010);
      expect(hexToInt32Little('01020304'), 0x4030201);
      expect(hexToInt32Little('1020304'), 0x4030201);
    });
    test('hexToInt40Little', () {
      expect(hexToInt40Little('1020304050'), 0x5040302010);
      expect(hexToInt40Little('0102030405'), 0x504030201);
      expect(hexToInt40Little('102030405'), 0x504030201);
    });
    test('hexToInt48Little', () {
      expect(hexToInt48Little('102030405060'), 0x605040302010);
      expect(hexToInt48Little('010203040506'), 0x60504030201);
      expect(hexToInt48Little('10203040506'), 0x60504030201);
    });
    test('hexToInt56Little', () {
      expect(hexToInt56Little('10203040506070'), 0x70605040302010);
      expect(hexToInt56Little('01020304050607'), 0x7060504030201);
      expect(hexToInt56Little('1020304050607'), 0x7060504030201);
    });
    test('hexToInt64Little', () {
      expect(hexToInt64Little('1020304050607080'), 0x8070605040302010);
      expect(hexToInt64Little('0102030405060708'), 0x807060504030201);
      expect(hexToInt64Little('102030405060708'), 0x807060504030201);
      expect(hexToInt64Little('ffeeddccbbaa9988'), 0x8899aabbccddeeff);
      expect(hexToInt64Little('8899aabbccddeeff'), 0xffeeddccbbaa9988);
    });

    test('hexToIntBig', () {
      expect(hexToIntBig('10'), 0x10);
      expect(hexToIntBig('1020'), 0x1020);
      expect(hexToIntBig('102030'), 0x102030);
      expect(hexToIntBig('10203040'), 0x10203040);
      expect(hexToIntBig('1020304050'), 0x1020304050);
      expect(hexToIntBig('102030405060'), 0x102030405060);
      expect(hexToIntBig('10203040506070'), 0x10203040506070);
    });
    test('hexToIntLittle', () {
      expect(hexToIntLittle('10'), 0x10);
      expect(hexToIntLittle('1020'), 0x2010);
      expect(hexToIntLittle('102030'), 0x302010);
      expect(hexToIntLittle('10203040'), 0x40302010);
      expect(hexToIntLittle('1020304050'), 0x5040302010);
      expect(hexToIntLittle('102030405060'), 0x605040302010);
      expect(hexToIntLittle('10203040506070'), 0x70605040302010);
    });
    test('hexToInt', () {
      expect(hexToInt('12345678', Endian.big), 0x12345678);
      expect(hexToInt('12345678', Endian.little), 0x78563412);
    });
  });
  group('A group of string tests', () {
    test('hexToInts8Big', () {
      expect(
        hexToInts8Big('00112233445566778899aabbccddeeff'),
        <int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ],
      );
    });
    test('hexToInts16Big', () {
      expect(
        hexToInts16Big('00112233445566778899aabbccddeeff'),
        <int>[
          0x0011, 0x2233, 0x4455, 0x6677, 0x8899, 0xaabb, 0xccdd, 0xeeff,
        ],
      );
    });
    test('hexToInts32Big', () {
      expect(
        hexToInts32Big('00112233445566778899aabbccddeeff'),
        <int>[
          0x00112233, 0x44556677, 0x8899aabb, 0xccddeeff,
        ],
      );
    });
    test('hexToInts64Big', () {
      expect(
        hexToInts64Big('00112233445566778899aabbccddeeff'),
        <int>[
          0x0011223344556677, 0x8899aabbccddeeff,
        ],
      );
      expect(
        hexToInts64Big('ffeeddccbbaa99887766554433221100'),
        <int>[
          0xffeeddccbbaa9988, 0x7766554433221100,
        ],
      );
    });

    test('hexToInts8Little', () {
      expect(
        hexToInts8Little('00112233445566778899aabbccddeeff'),
        <int>[
          0xff, 0xee, 0xdd, 0xcc, 0xbb, 0xaa, 0x99, 0x88,
          0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00,
        ],
      );
    });
    test('hexToInts16Little', () {
      expect(
        hexToInts16Little('00112233445566778899aabbccddeeff'),
        <int>[
          0xffee, 0xddcc, 0xbbaa, 0x9988, 0x7766, 0x5544, 0x3322, 0x1100,
        ],
      );
    });
    test('hexToInts32Little', () {
      expect(
        hexToInts32Little('00112233445566778899aabbccddeeff'),
        <int>[
          0xffeeddcc, 0xbbaa9988, 0x77665544, 0x33221100,
        ],
      );
    });
    test('hexToInts64Little', () {
      expect(
        hexToInts64Little('00112233445566778899aabbccddeeff'),
        <int>[
          0xffeeddccbbaa9988, 0x7766554433221100,
        ],
      );
    });

    test('hexToInts8', () {
      expect(
        hexToInts8('00112233445566778899aabbccddeeff', Endian.big),
        <int>[
          0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
          0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
        ],
      );
      expect(
        hexToInts8('00112233445566778899aabbccddeeff', Endian.little),
        <int>[
          0xff, 0xee, 0xdd, 0xcc, 0xbb, 0xaa, 0x99, 0x88,
          0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00,
        ],
      );
    });
    test('hexToInts16', () {
      expect(
        hexToInts16('00112233445566778899aabbccddeeff', Endian.big),
        <int>[
          0x0011, 0x2233, 0x4455, 0x6677, 0x8899, 0xaabb, 0xccdd, 0xeeff,
        ],
      );
      expect(
        hexToInts16('00112233445566778899aabbccddeeff', Endian.little),
        <int>[
          0xffee, 0xddcc, 0xbbaa, 0x9988, 0x7766, 0x5544, 0x3322, 0x1100,
        ],
      );
    });
    test('hexToInts32', () {
      expect(
        hexToInts32('00112233445566778899aabbccddeeff', Endian.big),
        <int>[
          0x00112233, 0x44556677, 0x8899aabb, 0xccddeeff,
        ],
      );
      expect(
        hexToInts32('00112233445566778899aabbccddeeff', Endian.little),
        <int>[
          0xffeeddcc, 0xbbaa9988, 0x77665544, 0x33221100,
        ],
      );
    });
    test('hexToInts64', () {
      expect(
        hexToInts64('00112233445566778899aabbccddeeff', Endian.big),
        <int>[
          0x0011223344556677, 0x8899aabbccddeeff,
        ],
      );
      expect(
        hexToInts64('00112233445566778899aabbccddeeff', Endian.little),
        <int>[
          0xffeeddccbbaa9988, 0x7766554433221100,
        ],
      );
    });
  });
}
