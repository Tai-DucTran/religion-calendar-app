// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_conversation_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbackConversationRepositoryHash() =>
    r'f2177f145d8c144d878856f57be9fcea11244cd1';

/// See also [feedbackConversationRepository].
@ProviderFor(feedbackConversationRepository)
final feedbackConversationRepositoryProvider =
    AutoDisposeProvider<FeedbackConversationRepository>.internal(
  feedbackConversationRepository,
  name: r'feedbackConversationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackConversationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FeedbackConversationRepositoryRef
    = AutoDisposeProviderRef<FeedbackConversationRepository>;
String _$feedbackConversationStreamHash() =>
    r'ddbcd37b9177375e2888ad14f09e1c5ce6fa21aa';

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

abstract class _$FeedbackConversationStream
    extends BuildlessAutoDisposeStreamNotifier<FeedbackConversation?> {
  late final String conversationId;

  Stream<FeedbackConversation?> build(
    String conversationId,
  );
}

/// See also [FeedbackConversationStream].
@ProviderFor(FeedbackConversationStream)
const feedbackConversationStreamProvider = FeedbackConversationStreamFamily();

/// See also [FeedbackConversationStream].
class FeedbackConversationStreamFamily
    extends Family<AsyncValue<FeedbackConversation?>> {
  /// See also [FeedbackConversationStream].
  const FeedbackConversationStreamFamily();

  /// See also [FeedbackConversationStream].
  FeedbackConversationStreamProvider call(
    String conversationId,
  ) {
    return FeedbackConversationStreamProvider(
      conversationId,
    );
  }

  @override
  FeedbackConversationStreamProvider getProviderOverride(
    covariant FeedbackConversationStreamProvider provider,
  ) {
    return call(
      provider.conversationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedbackConversationStreamProvider';
}

/// See also [FeedbackConversationStream].
class FeedbackConversationStreamProvider
    extends AutoDisposeStreamNotifierProviderImpl<FeedbackConversationStream,
        FeedbackConversation?> {
  /// See also [FeedbackConversationStream].
  FeedbackConversationStreamProvider(
    String conversationId,
  ) : this._internal(
          () => FeedbackConversationStream()..conversationId = conversationId,
          from: feedbackConversationStreamProvider,
          name: r'feedbackConversationStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackConversationStreamHash,
          dependencies: FeedbackConversationStreamFamily._dependencies,
          allTransitiveDependencies:
              FeedbackConversationStreamFamily._allTransitiveDependencies,
          conversationId: conversationId,
        );

  FeedbackConversationStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  Stream<FeedbackConversation?> runNotifierBuild(
    covariant FeedbackConversationStream notifier,
  ) {
    return notifier.build(
      conversationId,
    );
  }

  @override
  Override overrideWith(FeedbackConversationStream Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedbackConversationStreamProvider._internal(
        () => create()..conversationId = conversationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<FeedbackConversationStream,
      FeedbackConversation?> createElement() {
    return _FeedbackConversationStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackConversationStreamProvider &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedbackConversationStreamRef
    on AutoDisposeStreamNotifierProviderRef<FeedbackConversation?> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _FeedbackConversationStreamProviderElement
    extends AutoDisposeStreamNotifierProviderElement<FeedbackConversationStream,
        FeedbackConversation?> with FeedbackConversationStreamRef {
  _FeedbackConversationStreamProviderElement(super.provider);

  @override
  String get conversationId =>
      (origin as FeedbackConversationStreamProvider).conversationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
