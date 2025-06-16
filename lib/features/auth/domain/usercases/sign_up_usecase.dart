import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../core/usecases/usecase.dart';
import '../../../../../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/auth_repository.dart';

@injectable
class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String? username;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    this.username,
  });

  @override
  List<Object?> get props => [name, email, password, username];
}
