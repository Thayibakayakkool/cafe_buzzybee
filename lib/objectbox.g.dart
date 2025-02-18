// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/features/home/data/model/cart_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 4550428827727765555),
      name: 'CartItemModel',
      lastPropertyId: const obx_int.IdUid(7, 8488606552759987221),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6126799721643530898),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 2763190896624590579),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6334928724739508053),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3332559067991708151),
            name: 'image',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8478895476553499719),
            name: 'price',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 3817763381705969682),
            name: 'unit',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8488606552759987221),
            name: 'quantity',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 4550428827727765555),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    CartItemModel: obx_int.EntityDefinition<CartItemModel>(
        model: _entities[0],
        toOneRelations: (CartItemModel object) => [],
        toManyRelations: (CartItemModel object) => {},
        getId: (CartItemModel object) => object.id,
        setId: (CartItemModel object, int id) {
          object.id = id;
        },
        objectToFB: (CartItemModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final descriptionOffset = fbb.writeString(object.description);
          final imageOffset = fbb.writeString(object.image);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, imageOffset);
          fbb.addFloat64(4, object.price);
          fbb.addInt64(5, object.unit);
          fbb.addInt64(6, object.quantity);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final imageParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final priceParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final unitParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final quantityParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final object = CartItemModel(
              name: nameParam,
              description: descriptionParam,
              image: imageParam,
              price: priceParam,
              unit: unitParam,
              quantity: quantityParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [CartItemModel] entity fields to define ObjectBox queries.
class CartItemModel_ {
  /// See [CartItemModel.id].
  static final id =
      obx.QueryIntegerProperty<CartItemModel>(_entities[0].properties[0]);

  /// See [CartItemModel.name].
  static final name =
      obx.QueryStringProperty<CartItemModel>(_entities[0].properties[1]);

  /// See [CartItemModel.description].
  static final description =
      obx.QueryStringProperty<CartItemModel>(_entities[0].properties[2]);

  /// See [CartItemModel.image].
  static final image =
      obx.QueryStringProperty<CartItemModel>(_entities[0].properties[3]);

  /// See [CartItemModel.price].
  static final price =
      obx.QueryDoubleProperty<CartItemModel>(_entities[0].properties[4]);

  /// See [CartItemModel.unit].
  static final unit =
      obx.QueryIntegerProperty<CartItemModel>(_entities[0].properties[5]);

  /// See [CartItemModel.quantity].
  static final quantity =
      obx.QueryIntegerProperty<CartItemModel>(_entities[0].properties[6]);
}
