// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firestore_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFirestoreRepositoryHash() =>
    r'c0c4b03da7674b7a2724964963b97c5e07e6a4d4';

/// ! Restructure this Firestore implementation
/// Create a new folder to store everything related to [Firebase] and [Firestore]
/// lib/core/firebase
/// lib/core/firebase_provider
///
/// Copied from [userFirestoreRepository].
@ProviderFor(userFirestoreRepository)
final userFirestoreRepositoryProvider =
    AutoDisposeProvider<UserFirestoreRepository>.internal(
  userFirestoreRepository,
  name: r'userFirestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userFirestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserFirestoreRepositoryRef
    = AutoDisposeProviderRef<UserFirestoreRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
