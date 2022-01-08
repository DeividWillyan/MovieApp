import 'package:dartz/dartz.dart';
import 'package:movie/app/features/movie/domain/entities/movie_entity.dart';

abstract class GetMoviesRepository {
  Future<Either<Exception, MovieEntity>> call();
}
