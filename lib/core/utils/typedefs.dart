import 'package:dartz/dartz.dart';

typedef RequestParams<T> = Map<String, T>;

typedef ResponseFormat<T> = Future<Either<String, T>>;
