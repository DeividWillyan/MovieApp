import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/repositories/get_movies_repository.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase.dart';

class GetMoviesUseCaseImp implements GetMoviesUseCase {
  final GetMoviesRepository _getMoviesRepository;
  GetMoviesUseCaseImp(this._getMoviesRepository);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesRepository();
  }
}
