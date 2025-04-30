// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_feedback_conversations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFeedbackConversationsProviderHash() =>
    r'eb15a359f5d24fb622d2467156ff4d0a0e35c6f9';

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

abstract class _$UserFeedbackConversationsProvider
    extends BuildlessAutoDisposeAsyncNotifier<List<FeedbackConversation>> {
  late final int limit;
  late final bool includeAllMessages;
  late final int maxMessages;

  FutureOr<List<FeedbackConversation>> build({
    int limit = 20,
    bool includeAllMessages = true,
    int maxMessages = 10,
  });
}

/// See also [UserFeedbackConversationsProvider].
@ProviderFor(UserFeedbackConversationsProvider)
const userFeedbackConversationsProviderProvider =
    UserFeedbackConversationsProviderFamily();

/// See also [UserFeedbackConversationsProvider].
class UserFeedbackConversationsProviderFamily
    extends Family<AsyncValue<List<FeedbackConversation>>> {
  /// See also [UserFeedbackConversationsProvider].
  const UserFeedbackConversationsProviderFamily();

  /// See also [UserFeedbackConversationsProvider].
  UserFeedbackConversationsProviderProvider call({
    int limit = 20,
    bool includeAllMessages = true,
    int maxMessages = 10,
  }) {
    return UserFeedbackConversationsProviderProvider(
      limit: limit,
      includeAllMessages: includeAllMessages,
      maxMessages: maxMessages,
    );
  }

  @override
  UserFeedbackConversationsProviderProvider getProviderOverride(
    covariant UserFeedbackConversationsProviderProvider provider,
  ) {
    return call(
      limit: provider.limit,
      includeAllMessages: provider.includeAllMessages,
      maxMessages: provider.maxMessages,
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
  String? get name => r'userFeedbackConversationsProviderProvider';
}

/// See also [UserFeedbackConversationsProvider].
class UserFeedbackConversationsProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        UserFeedbackConversationsProvider, List<FeedbackConversation>> {
  /// See also [UserFeedbackConversationsProvider].
  UserFeedbackConversationsProviderProvider({
    int limit = 20,
    bool includeAllMessages = true,
    int maxMessages = 10,
  }) : this._internal(
          () => UserFeedbackConversationsProvider()
            ..limit = limit
            ..includeAllMessages = includeAllMessages
            ..maxMessages = maxMessages,
          from: userFeedbackConversationsProviderProvider,
          name: r'userFeedbackConversationsProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFeedbackConversationsProviderHash,
          dependencies: UserFeedbackConversationsProviderFamily._dependencies,
          allTransitiveDependencies: UserFeedbackConversationsProviderFamily
              ._allTransitiveDependencies,
          limit: limit,
          includeAllMessages: includeAllMessages,
          maxMessages: maxMessages,
        );

  UserFeedbackConversationsProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.includeAllMessages,
    required this.maxMessages,
  }) : super.internal();

  final int limit;
  final bool includeAllMessages;
  final int maxMessages;

  @override
  FutureOr<List<FeedbackConversation>> runNotifierBuild(
    covariant UserFeedbackConversationsProvider notifier,
  ) {
    return notifier.build(
      limit: limit,
      includeAllMessages: includeAllMessages,
      maxMessages: maxMessages,
    );
  }

  @override
  Override overrideWith(UserFeedbackConversationsProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserFeedbackConversationsProviderProvider._internal(
        () => create()
          ..limit = limit
          ..includeAllMessages = includeAllMessages
          ..maxMessages = maxMessages,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        includeAllMessages: includeAllMessages,
        maxMessages: maxMessages,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserFeedbackConversationsProvider,
      List<FeedbackConversation>> createElement() {
    return _UserFeedbackConversationsProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFeedbackConversationsProviderProvider &&
        other.limit == limit &&
        other.includeAllMessages == includeAllMessages &&
        other.maxMessages == maxMessages;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, includeAllMessages.hashCode);
    hash = _SystemHash.combine(hash, maxMessages.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserFeedbackConversationsProviderRef
    on AutoDisposeAsyncNotifierProviderRef<List<FeedbackConversation>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `includeAllMessages` of this provider.
  bool get includeAllMessages;

  /// The parameter `maxMessages` of this provider.
  int get maxMessages;
}

class _UserFeedbackConversationsProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        UserFeedbackConversationsProvider,
        List<FeedbackConversation>> with UserFeedbackConversationsProviderRef {
  _UserFeedbackConversationsProviderProviderElement(super.provider);

  @override
  int get limit => (origin as UserFeedbackConversationsProviderProvider).limit;
  @override
  bool get includeAllMessages =>
      (origin as UserFeedbackConversationsProviderProvider).includeAllMessages;
  @override
  int get maxMessages =>
      (origin as UserFeedbackConversationsProviderProvider).maxMessages;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
