abstract class UseCase<T, K> {
  Future<T> call(K params);
}

class NoParams {}
