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

import 'features/data/models/tranlations_model.dart';
import 'features/domain/entities/tranlations_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 6290545957653230806),
      name: 'TranlationsEntity',
      lastPropertyId: const obx_int.IdUid(4, 3013104058439038054),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1562543411166704207),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4445837053945210185),
            name: 'code',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1964893560031545436),
            name: 'tranlationVi',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3013104058439038054),
            name: 'tranlationEn',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 646653942791716625),
      name: 'TranslationsModel',
      lastPropertyId: const obx_int.IdUid(4, 3194566752977229474),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5828336001846208637),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6473714347038342951),
            name: 'code',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 7220141738422105491),
            name: 'translationVi',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3194566752977229474),
            name: 'translationEn',
            type: 9,
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
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
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
      lastEntityId: const obx_int.IdUid(2, 646653942791716625),
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
    TranlationsEntity: obx_int.EntityDefinition<TranlationsEntity>(
        model: _entities[0],
        toOneRelations: (TranlationsEntity object) => [],
        toManyRelations: (TranlationsEntity object) => {},
        getId: (TranlationsEntity object) => object.id,
        setId: (TranlationsEntity object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field TranlationsEntity.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (TranlationsEntity object, fb.Builder fbb) {
          final codeOffset = fbb.writeString(object.code);
          final tranlationViOffset = fbb.writeString(object.tranlationVi);
          final tranlationEnOffset = fbb.writeString(object.tranlationEn);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, codeOffset);
          fbb.addOffset(2, tranlationViOffset);
          fbb.addOffset(3, tranlationEnOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final codeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final tranlationViParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final tranlationEnParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final object = TranlationsEntity(
              id: idParam,
              code: codeParam,
              tranlationVi: tranlationViParam,
              tranlationEn: tranlationEnParam);

          return object;
        }),
    TranslationsModel: obx_int.EntityDefinition<TranslationsModel>(
        model: _entities[1],
        toOneRelations: (TranslationsModel object) => [],
        toManyRelations: (TranslationsModel object) => {},
        getId: (TranslationsModel object) => object.id,
        setId: (TranslationsModel object, int id) {
          object.id = id;
        },
        objectToFB: (TranslationsModel object, fb.Builder fbb) {
          final codeOffset = fbb.writeString(object.code);
          final translationViOffset = fbb.writeString(object.translationVi);
          final translationEnOffset = fbb.writeString(object.translationEn);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, codeOffset);
          fbb.addOffset(2, translationViOffset);
          fbb.addOffset(3, translationEnOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final codeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final translationViParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final translationEnParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final object = TranslationsModel(
              id: idParam,
              code: codeParam,
              translationVi: translationViParam,
              translationEn: translationEnParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [TranlationsEntity] entity fields to define ObjectBox queries.
class TranlationsEntity_ {
  /// See [TranlationsEntity.id].
  static final id =
      obx.QueryIntegerProperty<TranlationsEntity>(_entities[0].properties[0]);

  /// See [TranlationsEntity.code].
  static final code =
      obx.QueryStringProperty<TranlationsEntity>(_entities[0].properties[1]);

  /// See [TranlationsEntity.tranlationVi].
  static final tranlationVi =
      obx.QueryStringProperty<TranlationsEntity>(_entities[0].properties[2]);

  /// See [TranlationsEntity.tranlationEn].
  static final tranlationEn =
      obx.QueryStringProperty<TranlationsEntity>(_entities[0].properties[3]);
}

/// [TranslationsModel] entity fields to define ObjectBox queries.
class TranslationsModel_ {
  /// See [TranslationsModel.id].
  static final id =
      obx.QueryIntegerProperty<TranslationsModel>(_entities[1].properties[0]);

  /// See [TranslationsModel.code].
  static final code =
      obx.QueryStringProperty<TranslationsModel>(_entities[1].properties[1]);

  /// See [TranslationsModel.translationVi].
  static final translationVi =
      obx.QueryStringProperty<TranslationsModel>(_entities[1].properties[2]);

  /// See [TranslationsModel.translationEn].
  static final translationEn =
      obx.QueryStringProperty<TranslationsModel>(_entities[1].properties[3]);
}
