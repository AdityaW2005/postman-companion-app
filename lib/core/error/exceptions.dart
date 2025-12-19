class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

class SecureStorageException implements Exception {
  final String message;
  SecureStorageException(this.message);

  @override
  String toString() => 'SecureStorageException: $message';
}
