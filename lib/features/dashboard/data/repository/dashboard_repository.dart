import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/dashboard_entity.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboard();
  Future<Either<Failure, void>> saveDashboard(DashboardEntity dashboardEntity);
  Future<Either<Failure, void>> updateDashboard(DashboardEntity dashboardEntity);
  Future<Either<Failure, void>> deleteDashboard();
}
