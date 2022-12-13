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
String $collectionManagerHash() => r'2822ba5e44ca35dbcc972d1c5324c59ee1df4c34';

/// See also [collectionManager].
final collectionManagerProvider =
    AutoDisposeFutureProvider<GoalCollectionManager>(
  collectionManager,
  name: r'collectionManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $collectionManagerHash,
);
typedef CollectionManagerRef
    = AutoDisposeFutureProviderRef<GoalCollectionManager>;
String $collectionsHash() => r'11350d211837226299fa950c034903ee4a35fec9';

/// See also [collections].
final collectionsProvider = AutoDisposeFutureProvider<List<GoalCollection>>(
  collections,
  name: r'collectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $collectionsHash,
);
typedef CollectionsRef = AutoDisposeFutureProviderRef<List<GoalCollection>>;
String $currentCollectionHash() => r'97974749bba9bf2faf22c1a4486688fdc986919a';

/// See also [currentCollection].
final currentCollectionProvider = AutoDisposeFutureProvider<GoalCollection?>(
  currentCollection,
  name: r'currentCollectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $currentCollectionHash,
);
typedef CurrentCollectionRef = AutoDisposeFutureProviderRef<GoalCollection?>;
String $tagCollectionManagerHash() =>
    r'59ab8ae2775d9619da9f5c9d9992c8713448bb12';

/// See also [tagCollectionManager].
final tagCollectionManagerProvider =
    AutoDisposeFutureProvider<TagCollectionManager>(
  tagCollectionManager,
  name: r'tagCollectionManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $tagCollectionManagerHash,
);
typedef TagCollectionManagerRef
    = AutoDisposeFutureProviderRef<TagCollectionManager>;
String $tagsHash() => r'c22b9c5b21c59682a980d62848a78cbdd026b2d9';

/// See also [tags].
final tagsProvider = AutoDisposeFutureProvider<List<Tag>>(
  tags,
  name: r'tagsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $tagsHash,
);
typedef TagsRef = AutoDisposeFutureProviderRef<List<Tag>>;
String $goalManagerHash() => r'42472ecd0405bed6d1c833cd68a28df2b4897e41';

/// See also [goalManager].
final goalManagerProvider = AutoDisposeFutureProvider<GoalManager>(
  goalManager,
  name: r'goalManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $goalManagerHash,
);
typedef GoalManagerRef = AutoDisposeFutureProviderRef<GoalManager>;
String $goalsHash() => r'e7ee6ac7dc1c85a0bdc92ba0fa4a8f0c54291bae';

/// See also [goals].
final goalsProvider = AutoDisposeFutureProvider<List<Goal>>(
  goals,
  name: r'goalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $goalsHash,
);
typedef GoalsRef = AutoDisposeFutureProviderRef<List<Goal>>;
String $currentGoalHash() => r'5f396ca58c2087d5f38e24fb63691988f762733c';

/// See also [currentGoal].
final currentGoalProvider = AutoDisposeFutureProvider<Goal?>(
  currentGoal,
  name: r'currentGoalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $currentGoalHash,
);
typedef CurrentGoalRef = AutoDisposeFutureProviderRef<Goal?>;
String $goalProgressManagerHash() =>
    r'2326652e6abc5e55f313066cba59014f781b8460';

/// See also [goalProgressManager].
final goalProgressManagerProvider =
    AutoDisposeFutureProvider<GoalProgressManager>(
  goalProgressManager,
  name: r'goalProgressManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $goalProgressManagerHash,
);
typedef GoalProgressManagerRef
    = AutoDisposeFutureProviderRef<GoalProgressManager>;
String $actionWordManagerHash() => r'6afe4522c8a1a1980ca314d8eec01e91e7b510a1';

/// See also [actionWordManager].
final actionWordManagerProvider = AutoDisposeFutureProvider<ActionWordManager>(
  actionWordManager,
  name: r'actionWordManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $actionWordManagerHash,
);
typedef ActionWordManagerRef = AutoDisposeFutureProviderRef<ActionWordManager>;
