import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/dashboard_entity.dart';

abstract interface class IDashboardRepository {
  Future<Either<Failure, void>> createDashboard(DashboardEntity dashboardEntity);
  Future<Either<Failure, List<DashboardEntity>>> getAllDashboards();
  Future<Either<Failure, void>> deleteDashboard(String dashboardId);
  Future<Either<Failure, DashboardEntity?>> getDashboardById(String dashboardId);
  Future<Either<Failure, void>> updateDashboard(DashboardEntity dashboardEntity);
}
