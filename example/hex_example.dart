import 'dart:typed_data';

import 'package:hex/hex.dart';

void main() {
  final String a1 = byteDataToHexBig(Uint8List.fromList([ 0x00, 0x11 ]).buffer.asByteData());
  final String a2 = byteDataToHexLittle(Uint8List.fromList([ 0x00, 0x11 ]).buffer.asByteData());
  final String a3 = byteDataToHex(Uint8List.fromList([ 0x00, 0x11 ]).buffer.asByteData(), Endian.big);

  final String b1 = bytes8ToHexBig(Uint8List.fromList([ 0x00, 0x11 ]));
  final String b2 = bytes16ToHexBig(Uint16List.fromList([ 0x0000, 0x1111 ]));
  final String b3 = bytes32ToHexBig(Uint32List.fromList([ 0x00000000, 0x11111111 ]));
  final String b4 = bytes64ToHexBig(Uint64List.fromList([ 0x0000000000000000, 0x1111111111111111 ]));

  final String c1 = bytes8ToHexLittle(Uint8List.fromList([ 0x00, 0x11 ]));
  final String c2 = bytes16ToHexLittle(Uint16List.fromList([ 0x0000, 0x1111 ]));
  final String c3 = bytes32ToHexLittle(Uint32List.fromList([ 0x00000000, 0x11111111 ]));
  final String c4 = bytes64ToHexLittle(Uint64List.fromList([ 0x0000000000000000, 0x1111111111111111 ]));

  final String d1 = bytes8ToHex(Uint8List.fromList([ 0x00, 0x11 ]), Endian.big);
  final String d2 = bytes16ToHex(Uint16List.fromList([ 0x0000, 0x1111 ]), Endian.big);
  final String d3 = bytes32ToHex(Uint32List.fromList([ 0x00000000, 0x11111111 ]), Endian.big);
  final String d4 = bytes64ToHex(Uint64List.fromList([ 0x0000000000000000, 0x1111111111111111 ]), Endian.big);

  final String e1 = ints8ToHexBig([ 0x00, 0x11, 0x22, 0x33 ]);
  final String e2 = ints16ToHexBig([ 0x0000, 0x1111, 0x2222, 0x3333 ]);
  final String e3 = ints32ToHexBig([ 0x00000000, 0x11111111, 0x22222222, 0x33333333 ]);
  final String e4 = ints64ToHexBig([ 0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333 ]);

  final String f1 = ints8ToHexLittle([ 0x00, 0x11, 0x22, 0x33 ]);
  final String f2 = ints16ToHexLittle([ 0x0000, 0x1111, 0x2222, 0x3333 ]);
  final String f3 = ints32ToHexLittle([ 0x00000000, 0x11111111, 0x22222222, 0x33333333 ]);
  final String f4 = ints64ToHexLittle([ 0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333 ]);

  final String g1 = ints8ToHex([ 0x00, 0x11, 0x22, 0x33 ], Endian.big);
  final String g2 = ints16ToHex([ 0x0000, 0x1111, 0x2222, 0x3333 ], Endian.big);
  final String g3 = ints32ToHex([ 0x00000000, 0x11111111, 0x22222222, 0x33333333 ], Endian.big);
  final String g4 = ints64ToHex([ 0x0000000000000000, 0x1111111111111111, 0x2222222222222222, 0x3333333333333333 ], Endian.big);

  final String h1 = int8ToHex(0x11);

  final String i1 = int16ToHexBig(0x1122);
  final String i2 = int24ToHexBig(0x112233);
  final String i3 = int32ToHexBig(0x11223344);
  final String i4 = int40ToHexBig(0x1122334455);
  final String i5 = int48ToHexBig(0x112233445566);
  final String i6 = int56ToHexBig(0x11223344556677);
  final String i7 = int64ToHexBig(0x1122334455667788);

  final String j1 = int16ToHexLittle(0x1122);
  final String j2 = int24ToHexLittle(0x112233);
  final String j3 = int32ToHexLittle(0x11223344);
  final String j4 = int40ToHexLittle(0x1122334455);
  final String j5 = int48ToHexLittle(0x112233445566);
  final String j6 = int56ToHexLittle(0x11223344556677);
  final String j7 = int64ToHexLittle(0x1122334455667788);

  final String k1 = intToHexBig(0x11223344);
  final String k2 = intToHexLittle(0x11223344);
  final String k3 = intToHex(0x11223344, Endian.big);

  final int l1 = hexToInt8('11');

  final int m1 = hexToInt16Big('1122');
  final int m2 = hexToInt24Big('112233');
  final int m3 = hexToInt32Big('11223344');
  final int m4 = hexToInt40Big('1122334455');
  final int m5 = hexToInt48Big('112233445566');
  final int m6 = hexToInt56Big('11223344556677');
  final int m7 = hexToInt64Big('1122334455667788');

  final int n1 = hexToInt16Little('1122');
  final int n2 = hexToInt24Little('112233');
  final int n3 = hexToInt32Little('11223344');
  final int n4 = hexToInt40Little('1122334455');
  final int n5 = hexToInt48Little('112233445566');
  final int n6 = hexToInt56Little('11223344556677');
  final int n7 = hexToInt64Little('1122334455667788');

  final int o1 = hexToIntBig('11223344');
  final int o2 = hexToIntLittle('11223344');
  final int o3 = hexToInt('11223344', Endian.big);

  final List<int> p1 = hexToInts8Big('1122');
  final List<int> p2 = hexToInts16Big('11223344');
  final List<int> p3 = hexToInts32Big('1122334455667788');
  final List<int> p4 = hexToInts64Big('112233445566778899aabbccddeeff');

  final List<int> q1 = hexToInts8Little('1122');
  final List<int> q2 = hexToInts16Little('11223344');
  final List<int> q3 = hexToInts32Little('1122334455667788');
  final List<int> q4 = hexToInts64Little('112233445566778899aabbccddeeff');

  final List<int> r1 = hexToInts8('11223344', Endian.big);
  final List<int> r2 = hexToInts16('1122334455667788', Endian.big);
  final List<int> r3 = hexToInts32('112233445566778899aabbccddeeff', Endian.big);
  final List<int> r4 = hexToInts64('112233445566778899aabbccddeeff', Endian.big);

  final String s1 = bigInt8ToHex(BigInt.from(0x11));

  final String t1 = bigInt64ToHexBig(BigInt.parse('0x1122334455667788', radix: 16));
  final String t2 = bigInt128ToHexBig(BigInt.parse('0x112233445566778899aabbccddeeff00', radix: 16));

  final String u1 = bigInt64ToHexLittle(BigInt.parse('0x1122334455667788', radix: 16));
  final String u2 = bigInt128ToHexLittle(BigInt.parse('0x112233445566778899aabbccddeeff00', radix: 16));

  final String v1 = bigInt64ToHex(BigInt.parse('0x1122334455667788', radix: 16), Endian.big);
  final String v2 = bigInt128ToHex(BigInt.parse('0x112233445566778899aabbccddeeff00', radix: 16), Endian.big);

  final BigInt w1 = hexToBigInt8('11');

  final BigInt x1 = hexToBigInt64Big('1122334455667788');
  final BigInt x2 = hexToBigInt128Big('112233445566778899aabbccddeeff00');

  final BigInt y1 = hexToBigInt64Little('1122334455667788');
  final BigInt y2 = hexToBigInt128Little('112233445566778899aabbccddeeff00');

  final BigInt z1 = hexToBigInt64('1122334455667788', Endian.big);
  final BigInt z2 = hexToBigInt128('112233445566778899aabbccddeeff00', Endian.big);
}
