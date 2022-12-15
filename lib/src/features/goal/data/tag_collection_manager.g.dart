// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_collection_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $TagCollectionManagerHash() =>
    r'95873c0a9b5848166f59a6392a157e13ff917c45';

/// See also [TagCollectionManager].
final tagCollectionManagerProvider =
    AutoDisposeAsyncNotifierProvider<TagCollectionManager, List<Tag>>(
  TagCollectionManager.new,
  name: r'tagCollectionManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $TagCollectionManagerHash,
);
typedef TagCollectionManagerRef
    = AutoDisposeAsyncNotifierProviderRef<List<Tag>>;

abstract class _$TagCollectionManager
    extends AutoDisposeAsyncNotifier<List<Tag>> {
  @override
  FutureOr<List<Tag>> build();
}
