// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:hex/hex.dart';

class BigInt8ToHexBenchmark extends BenchmarkBase {
  BigInt8ToHexBenchmark() : super('bigInt8ToHex');

  final BigInt test = BigInt.from(0x10);

  @override
  void run() {
    bigInt8ToHex(test);
  }
}
class BigInt64ToHexBigBenchmark extends BenchmarkBase {
  BigInt64ToHexBigBenchmark() : super('bigInt64ToHexBig');

  final BigInt test = BigInt.parse('1020304050607080');

  @override
  void run() {
    bigInt64ToHexBig(test);
  }
}
class BigInt128ToHexBigBenchmark extends BenchmarkBase {
  BigInt128ToHexBigBenchmark() : super('bigInt128ToHexBig');

  final BigInt test = BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16);

  @override
  void run() {
    bigInt128ToHexBig(test);
  }
}

class BigInt64ToHexLittleBenchmark extends BenchmarkBase {
  BigInt64ToHexLittleBenchmark() : super('bigInt64ToHexLittle');

  final BigInt test = BigInt.parse('1020304050607080');

  @override
  void run() {
    bigInt64ToHexLittle(test);
  }
}
class BigInt128ToHexLittleBenchmark extends BenchmarkBase {
  BigInt128ToHexLittleBenchmark() : super('bigInt128ToHexLittle');

  final BigInt test = BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16);

  @override
  void run() {
    bigInt128ToHexLittle(test);
  }
}

class BigInt64ToHexBenchmark extends BenchmarkBase {
  BigInt64ToHexBenchmark() : super('bigInt64ToHex');

  final BigInt test = BigInt.parse('1020304050607080');

  @override
  void run() {
    bigInt64ToHex(test);
  }
}
class BigInt128ToHexBenchmark extends BenchmarkBase {
  BigInt128ToHexBenchmark() : super('bigInt128ToHex');

  final BigInt test = BigInt.parse('102030405060708090a0b0c0d0e0f000', radix: 16);

  @override
  void run() {
    bigInt128ToHex(test);
  }
}

class HexToBigInt8Benchmark extends BenchmarkBase {
  HexToBigInt8Benchmark() : super('hexToBigInt8');

  final String test = '10';

  @override
  void run() {
    hexToBigInt8(test);
  }
}

class HexToBigInt64BigBenchmark extends BenchmarkBase {
  HexToBigInt64BigBenchmark() : super('hexToBigInt64Big');

  final String test = '1020304050607080';

  @override
  void run() {
    hexToBigInt64Big(test);
  }
}
class HexToBigInt128BigBenchmark extends BenchmarkBase {
  HexToBigInt128BigBenchmark() : super('hexToBigInt128Big');

  final String test = '102030405060708090a0b0c0d0e0f000';

  @override
  void run() {
    hexToBigInt128Big(test);
  }
}

class HexToBigInt64LittleBenchmark extends BenchmarkBase {
  HexToBigInt64LittleBenchmark() : super('hexToBigInt64Little');

  final String test = '1020304050607080';

  @override
  void run() {
    hexToBigInt64Little(test);
  }
}
class HexToBigInt128LittleBenchmark extends BenchmarkBase {
  HexToBigInt128LittleBenchmark() : super('hexToBigInt128Little');

  final String test = '102030405060708090a0b0c0d0e0f000';

  @override
  void run() {
    hexToBigInt128Little(test);
  }
}

class HexToBigInt64Benchmark extends BenchmarkBase {
  HexToBigInt64Benchmark() : super('hexToBigInt64');

  final String test = '1020304050607080';

  @override
  void run() {
    hexToBigInt64(test);
  }
}
class HexToBigInt128Benchmark extends BenchmarkBase {
  HexToBigInt128Benchmark() : super('hexToBigInt128');

  final String test = '102030405060708090a0b0c0d0e0f000';

  @override
  void run() {
    hexToBigInt128(test);
  }
}

class BytesToHexBigBenchmark extends BenchmarkBase {
  BytesToHexBigBenchmark() : super('bytesToHexBig');

  final ByteData data = Uint8List.fromList(<int>[
    0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
  ]).buffer.asByteData();

  @override
  void run() {
    byteDataToHexBig(data);
  }
}
class BytesToHexLittleBenchmark extends BenchmarkBase {
  BytesToHexLittleBenchmark() : super('bytesToHexLittle');

  final ByteData data = Uint8List.fromList(<int>[
    0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
  ]).buffer.asByteData();

  @override
  void run() {
    byteDataToHexLittle(data);
  }
}
class BytesToHexBenchmark extends BenchmarkBase {
  BytesToHexBenchmark() : super('bytesToHex');

  final ByteData data = Uint8List.fromList(<int>[
    0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
  ]).buffer.asByteData();

  @override
  void run() {
    byteDataToHex(data, Endian.big);
  }
}

class Bytes8ToHexBigBenchmark extends BenchmarkBase {
  Bytes8ToHexBigBenchmark() : super('bytes8ToHexBig');

  final Uint8List bytes = Uint8List.fromList(
    <int>[ 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88 ],
  );

  @override
  void run() {
    bytes8ToHexBig(bytes);
  }
}
class Bytes16ToHexBigBenchmark extends BenchmarkBase {
  Bytes16ToHexBigBenchmark() : super('bytes16ToHexBig');

  final Uint16List bytes = Uint16List.fromList(
    <int>[ 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777, 0x8888 ],
  );

  @override
  void run() {
    bytes16ToHexBig(bytes);
  }
}
class Bytes32ToHexBigBenchmark extends BenchmarkBase {
  Bytes32ToHexBigBenchmark() : super('bytes32ToHexBig');

  final Uint32List bytes = Uint32List.fromList(
    <int>[ 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777, 0x88888888 ],
  );

  @override
  void run() {
    bytes32ToHexBig(bytes);
  }
}
class Bytes64ToHexBigBenchmark extends BenchmarkBase {
  Bytes64ToHexBigBenchmark() : super('bytes64ToHexBig');

  final Uint64List bytes = Uint64List.fromList(
    <int>[ 0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777, 0x8888888888888888 ],
  );

  @override
  void run() {
    bytes64ToHexBig(bytes);
  }
}

class Bytes8ToHexLittleBenchmark extends BenchmarkBase {
  Bytes8ToHexLittleBenchmark() : super('bytes8ToHexLittle');

  final Uint8List bytes = Uint8List.fromList(
    <int>[ 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88 ],
  );

  @override
  void run() {
    bytes8ToHexLittle(bytes);
  }
}
class Bytes16ToHexLittleBenchmark extends BenchmarkBase {
  Bytes16ToHexLittleBenchmark() : super('bytes16ToHexLittle');

  final Uint16List bytes = Uint16List.fromList(
    <int>[ 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777, 0x8888 ],
  );

  @override
  void run() {
    bytes16ToHexLittle(bytes);
  }
}
class Bytes32ToHexLittleBenchmark extends BenchmarkBase {
  Bytes32ToHexLittleBenchmark() : super('bytes32ToHexLittle');

  final Uint32List bytes = Uint32List.fromList(
    <int>[ 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777, 0x88888888 ],
  );

  @override
  void run() {
    bytes32ToHexLittle(bytes);
  }
}
class BytesToHex64LittleBenchmark extends BenchmarkBase {
  BytesToHex64LittleBenchmark() : super('bytes64ToHexLittle');

  final Uint64List bytes = Uint64List.fromList(
    <int>[ 0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777, 0x8888888888888888 ],
  );

  @override
  void run() {
    bytes64ToHexLittle(bytes);
  }
}

class Bytes8ToHexBenchmark extends BenchmarkBase {
  Bytes8ToHexBenchmark() : super('bytes8ToHex');

  final Uint8List bytes = Uint8List.fromList(
    <int>[ 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88 ],
  );

  @override
  void run() {
    bytes8ToHex(bytes);
  }
}
class Bytes16ToHexBenchmark extends BenchmarkBase {
  Bytes16ToHexBenchmark() : super('bytes16ToHex');

  final Uint16List bytes = Uint16List.fromList(
    <int>[ 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777, 0x8888 ],
  );

  @override
  void run() {
    bytes16ToHex(bytes);
  }
}
class Bytes32ToHexBenchmark extends BenchmarkBase {
  Bytes32ToHexBenchmark() : super('bytes32ToHex');

  final Uint32List bytes = Uint32List.fromList(
    <int>[ 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777, 0x88888888 ],
  );

  @override
  void run() {
    bytes32ToHex(bytes);
  }
}
class Bytes64ToHexBenchmark extends BenchmarkBase {
  Bytes64ToHexBenchmark() : super('bytes64ToHex');

  final Uint64List bytes = Uint64List.fromList(
    <int>[ 0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777, 0x8888888888888888 ],
  );

  @override
  void run() {
    bytes64ToHex(bytes);
  }
}

class Int8ToHexBenchmark extends BenchmarkBase {
  const Int8ToHexBenchmark() : super('int8ToHex');

  @override
  void run() {
    int8ToHex(0x10);
  }
}

class Int16ToHexBigBenchmark extends BenchmarkBase {
  const Int16ToHexBigBenchmark() : super('int16ToHexBig');

  @override
  void run() {
    int16ToHexBig(0x1020);
  }
}
class Int24ToHexBigBenchmark extends BenchmarkBase {
  const Int24ToHexBigBenchmark() : super('int24ToHexBig');

  @override
  void run() {
    int24ToHexBig(0x102030);
  }
}
class Int32ToHexBigBenchmark extends BenchmarkBase {
  const Int32ToHexBigBenchmark() : super('int32ToHexBig');

  @override
  void run() {
    int32ToHexBig(0x10203040);
  }
}
class Int40ToHexBigBenchmark extends BenchmarkBase {
  const Int40ToHexBigBenchmark() : super('int40ToHexBig');

  @override
  void run() {
    int40ToHexBig(0x1020304050);
  }
}
class Int48ToHexBigBenchmark extends BenchmarkBase {
  const Int48ToHexBigBenchmark() : super('int48ToHexBig');

  @override
  void run() {
    int48ToHexBig(0x102030405060);
  }
}
class Int56ToHexBigBenchmark extends BenchmarkBase {
  const Int56ToHexBigBenchmark() : super('int56ToHexBig');

  @override
  void run() {
    int56ToHexBig(0x10203040506070);
  }
}
class Int64ToHexBigBenchmark extends BenchmarkBase {
  const Int64ToHexBigBenchmark() : super('int64ToHexBig');

  @override
  void run() {
    int64ToHexBig(0x1020304050607080);
  }
}

class IntToHexLittle2Benchmark extends BenchmarkBase {
  const IntToHexLittle2Benchmark() : super('intToHexLittle2');

  @override
  void run() {
    int16ToHexLittle(0x1020);
  }
}
class IntToHexLittle3Benchmark extends BenchmarkBase {
  const IntToHexLittle3Benchmark() : super('intToHexLittle3');

  @override
  void run() {
    int24ToHexLittle(0x102030);
  }
}
class IntToHexLittle4Benchmark extends BenchmarkBase {
  const IntToHexLittle4Benchmark() : super('intToHexLittle4');

  @override
  void run() {
    int32ToHexLittle(0x10203040);
  }
}
class IntToHexLittle5Benchmark extends BenchmarkBase {
  const IntToHexLittle5Benchmark() : super('intToHexLittle5');

  @override
  void run() {
    int40ToHexLittle(0x1020304050);
  }
}
class IntToHexLittle6Benchmark extends BenchmarkBase {
  const IntToHexLittle6Benchmark() : super('intToHexLittle6');

  @override
  void run() {
    int48ToHexLittle(0x102030405060);
  }
}
class IntToHexLittle7Benchmark extends BenchmarkBase {
  const IntToHexLittle7Benchmark() : super('intToHexLittle7');

  @override
  void run() {
    int56ToHexLittle(0x10203040506070);
  }
}
class IntToHexLittle8Benchmark extends BenchmarkBase {
  const IntToHexLittle8Benchmark() : super('intToHexLittle8');

  @override
  void run() {
    int64ToHexLittle(0x1020304050607080);
  }
}

class IntToHexBigBenchmark extends BenchmarkBase {
  const IntToHexBigBenchmark() : super('intToHexBig');

  @override
  void run() {
    intToHexBig(0x12345678);
  }
}
class IntToHexLittleBenchmark extends BenchmarkBase {
  const IntToHexLittleBenchmark() : super('intToHexLittle');

  @override
  void run() {
    intToHexLittle(0x12345678);
  }
}
class IntToHexBenchmark extends BenchmarkBase {
  const IntToHexBenchmark() : super('intToHex');

  @override
  void run() {
    intToHex(0x12345678, Endian.big);
  }
}

class HexToInt8Benchmark extends BenchmarkBase {
  const HexToInt8Benchmark() : super('hexToInt8Big');

  @override
  void run() {
    hexToInt8('11');
  }
}

class HexToInt16BigBenchmark extends BenchmarkBase {
  const HexToInt16BigBenchmark() : super('hexToInt16Big');

  @override
  void run() {
    hexToInt16Big('1020');
  }
}
class HexToInt24BigBenchmark extends BenchmarkBase {
  const HexToInt24BigBenchmark() : super('hexToInt24Big');

  @override
  void run() {
    hexToInt24Big('102030');
  }
}
class HexToInt32BigBenchmark extends BenchmarkBase {
  const HexToInt32BigBenchmark() : super('hexToInt32Big');

  @override
  void run() {
    hexToInt32Big('10203040');
  }
}
class HexToInt40BigBenchmark extends BenchmarkBase {
  const HexToInt40BigBenchmark() : super('hexToInt40Big');

  @override
  void run() {
    hexToInt40Big('1020304050');
  }
}
class HexToInt48BigBenchmark extends BenchmarkBase {
  const HexToInt48BigBenchmark() : super('hexToInt48Big');

  @override
  void run() {
    hexToInt48Big('102030405060');
  }
}
class HexToInt56BigBenchmark extends BenchmarkBase {
  const HexToInt56BigBenchmark() : super('hexToInt56Big');

  @override
  void run() {
    hexToInt56Big('10203040506070');
  }
}
class HexToIntBig64Benchmark extends BenchmarkBase {
  const HexToIntBig64Benchmark() : super('hexToInt64Big');

  @override
  void run() {
    hexToInt64Big('1020304050607080');
  }
}

class HexToInt16LittleBenchmark extends BenchmarkBase {
  const HexToInt16LittleBenchmark() : super('hexToInt16Little');

  @override
  void run() {
    hexToInt16Little('1020');
  }
}
class HexToInt24LittleBenchmark extends BenchmarkBase {
  const HexToInt24LittleBenchmark() : super('hexToInt24Little');

  @override
  void run() {
    hexToInt24Little('102030');
  }
}
class HexToInt32LittleBenchmark extends BenchmarkBase {
  const HexToInt32LittleBenchmark() : super('hexToInt32Little');

  @override
  void run() {
    hexToInt32Little('10203040');
  }
}
class HexToInt40LittleBenchmark extends BenchmarkBase {
  const HexToInt40LittleBenchmark() : super('hexToInt40Little');

  @override
  void run() {
    hexToInt40Little('1020304050');
  }
}
class HexToInt48LittleBenchmark extends BenchmarkBase {
  const HexToInt48LittleBenchmark() : super('hexToInt48Little');

  @override
  void run() {
    hexToInt48Little('102030405060');
  }
}
class HexToInt56LittleBenchmark extends BenchmarkBase {
  const HexToInt56LittleBenchmark() : super('hexToInt56Little');

  @override
  void run() {
    hexToInt56Little('10203040506070');
  }
}
class HexToInt64LittleBenchmark extends BenchmarkBase {
  const HexToInt64LittleBenchmark() : super('hexToInt64Little');

  @override
  void run() {
    hexToInt64Little('1020304050607080');
  }
}

class HexToIntBigBenchmark extends BenchmarkBase {
  const HexToIntBigBenchmark() : super('hexToIntBig');

  @override
  void run() {
    hexToIntBig('12345678');
  }
}
class HexToIntLittleBenchmark extends BenchmarkBase {
  const HexToIntLittleBenchmark() : super('hexToIntLittle');

  @override
  void run() {
    hexToIntLittle('12345678');
  }
}
class HexToIntBenchmark extends BenchmarkBase {
  const HexToIntBenchmark() : super('hexToInt');

  @override
  void run() {
    hexToInt('12345678', Endian.big);
  }
}

void main() {
  BigInt8ToHexBenchmark().report();

  BigInt64ToHexBigBenchmark().report();
  BigInt128ToHexBigBenchmark().report();

  BigInt64ToHexLittleBenchmark().report();
  BigInt128ToHexLittleBenchmark().report();

  BigInt64ToHexBenchmark().report();
  BigInt128ToHexBenchmark().report();

  HexToBigInt8Benchmark().report();

  HexToBigInt64BigBenchmark().report();
  HexToBigInt128BigBenchmark().report();

  HexToBigInt64LittleBenchmark().report();
  HexToBigInt128LittleBenchmark().report();

  HexToBigInt64Benchmark().report();
  HexToBigInt128Benchmark().report();

  BytesToHexBigBenchmark().report();
  BytesToHexLittleBenchmark().report();
  BytesToHexBenchmark().report();

  Bytes8ToHexBigBenchmark().report();
  Bytes16ToHexBigBenchmark().report();
  Bytes32ToHexBigBenchmark().report();
  Bytes64ToHexBigBenchmark().report();

  Bytes8ToHexLittleBenchmark().report();
  Bytes16ToHexLittleBenchmark().report();
  Bytes32ToHexLittleBenchmark().report();
  BytesToHex64LittleBenchmark().report();

  Bytes8ToHexBenchmark().report();
  Bytes16ToHexBenchmark().report();
  Bytes32ToHexBenchmark().report();
  Bytes64ToHexBenchmark().report();

  Int8ToHexBenchmark().report();

  Int16ToHexBigBenchmark().report();
  Int24ToHexBigBenchmark().report();
  Int32ToHexBigBenchmark().report();
  Int40ToHexBigBenchmark().report();
  Int48ToHexBigBenchmark().report();
  Int56ToHexBigBenchmark().report();
  Int64ToHexBigBenchmark().report();

  IntToHexLittle2Benchmark().report();
  IntToHexLittle3Benchmark().report();
  IntToHexLittle4Benchmark().report();
  IntToHexLittle5Benchmark().report();
  IntToHexLittle6Benchmark().report();
  IntToHexLittle7Benchmark().report();
  IntToHexLittle8Benchmark().report();

  IntToHexBigBenchmark().report();
  IntToHexLittleBenchmark().report();
  IntToHexBenchmark().report();

  HexToInt8Benchmark().report();

  HexToInt16BigBenchmark().report();
  HexToInt24BigBenchmark().report();
  HexToInt32BigBenchmark().report();
  HexToInt40BigBenchmark().report();
  HexToInt48BigBenchmark().report();
  HexToInt56BigBenchmark().report();
  HexToIntBig64Benchmark().report();

  HexToInt16LittleBenchmark().report();
  HexToInt24LittleBenchmark().report();
  HexToInt32LittleBenchmark().report();
  HexToInt40LittleBenchmark().report();
  HexToInt48LittleBenchmark().report();
  HexToInt56LittleBenchmark().report();
  HexToInt64LittleBenchmark().report();

  HexToIntBigBenchmark().report();
  HexToIntLittleBenchmark().report();
  HexToIntBenchmark().report();
}
