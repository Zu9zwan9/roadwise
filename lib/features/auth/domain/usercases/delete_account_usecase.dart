import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../core/usecases/usecase.dart';
import '../../../../domain/repositories/auth_repository.dart';

@injectable
class DeleteAccountUseCase implements UseCase<void, DeleteAccountParams> {
  final AuthRepository repository;

  DeleteAccountUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteAccountParams params) async {
    return await repository.deleteAccount(
      userId: params.userId,
      password: params.password,
    );
  }
}

class DeleteAccountParams extends Equatable {
  final int userId;
  final String password;

  const DeleteAccountParams({required this.userId, required this.password});

  @override
  List<Object> get props => [userId, password];
}
