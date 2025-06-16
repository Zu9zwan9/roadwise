import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../core/usecases/usecase.dart';
import '../../../../domain/repositories/auth_repository.dart';

@injectable
class ChangePasswordUseCase implements UseCase<void, ChangePasswordParams> {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ChangePasswordParams params) async {
    return await repository.changePassword(
      userId: params.userId,
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
    );
  }
}

class ChangePasswordParams extends Equatable {
  final int userId;
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.userId,
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [userId, currentPassword, newPassword];
}
