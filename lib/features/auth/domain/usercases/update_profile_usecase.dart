import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/auth_repository.dart';

@injectable
class UpdateProfileUseCase implements UseCase<UserEntity, UpdateProfileParams> {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(
      userId: params.userId,
      name: params.name,
      username: params.username,
      profileImageUrl: params.profileImageUrl,
    );
  }
}

class UpdateProfileParams extends Equatable {
  final int userId;
  final String? name;
  final String? username;
  final String? profileImageUrl;

  const UpdateProfileParams({
    required this.userId,
    this.name,
    this.username,
    this.profileImageUrl,
  });

  @override
  List<Object?> get props => [userId, name, username, profileImageUrl];
}
