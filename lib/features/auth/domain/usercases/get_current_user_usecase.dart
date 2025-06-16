import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../core/usecases/usecase.dart';
import '../../../../../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/auth_repository.dart';

@injectable
class GetCurrentUserUseCase implements UseCaseNoParams<UserEntity> {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getCurrentUser();
  }
}
