import 'dart:io';

import 'package:cafe_buzzybee/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

Future<Store> objectBoxService() async {
  String dbPath;

  try {
    final directory = await getApplicationDocumentsDirectory();
    dbPath = '${directory.path}/objectbox';
  } catch (e) {
    dbPath = '${Directory.current.path}/objectbox';
  }

  final dbDirectory = Directory(dbPath);
  if (dbDirectory.existsSync()) {
    dbDirectory.deleteSync(recursive: true);
  }

  final store = Store(
    getObjectBoxModel(),
    directory: dbPath,
  );
  return store;
}
