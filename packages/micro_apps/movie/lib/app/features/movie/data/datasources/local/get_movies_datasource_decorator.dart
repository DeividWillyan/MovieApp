import 'package:dartz/dartz.dart';

import '../../../domain/entities/movie_entity.dart';
import '../get_movies_datasource.dart';

class GetMoviesDataSourceDecorator implements GetMoviesDataSource {
  final GetMoviesDataSource _getMoviesDataSource;
  GetMoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() => _getMoviesDataSource();
}
