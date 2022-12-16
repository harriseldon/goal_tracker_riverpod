// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

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

String $isarInstanceHash() => r'b0a46711fb9945272e6f0180fd837767d52d45a2';

/// See also [isarInstance].
final isarInstanceProvider = FutureProvider<Isar>(
  isarInstance,
  name: r'isarInstanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $isarInstanceHash,
);
typedef IsarInstanceRef = FutureProviderRef<Isar>;
String $collectionsHash() => r'f5770cd68f54bce4e916ad83c297c6ec43ffebb4';

/// See also [collections].
final collectionsProvider = AutoDisposeFutureProvider<List<GoalCollection>>(
  collections,
  name: r'collectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $collectionsHash,
);
typedef CollectionsRef = AutoDisposeFutureProviderRef<List<GoalCollection>>;
String $currentCollectionHash() => r'a2d7dbac08f70d1b52b04d9562c40bd76367b182';

/// See also [currentCollection].
final currentCollectionProvider = AutoDisposeFutureProvider<GoalCollection?>(
  currentCollection,
  name: r'currentCollectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $currentCollectionHash,
);
typedef CurrentCollectionRef = AutoDisposeFutureProviderRef<GoalCollection?>;
String $currentGoalHash() => r'46e6251ee5d4341bda73608325901d637da63c13';

/// See also [currentGoal].
final currentGoalProvider = AutoDisposeFutureProvider<Goal?>(
  currentGoal,
  name: r'currentGoalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $currentGoalHash,
);
typedef CurrentGoalRef = AutoDisposeFutureProviderRef<Goal?>;
