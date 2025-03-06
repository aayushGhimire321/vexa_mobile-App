import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/dashboard_entity.dart';
import '../repository/dashboard_repository.dart';

class CreateDashboard {
  final IDashboardRepository repository;

  CreateDashboard(this.repository);

  Future<Either<Failure, void>> call(DashboardEntity dashboardEntity) async {
    return await repository.createDashboard(dashboardEntity);
  }
}

class GetAllDashboards {
  final IDashboardRepository repository;

  GetAllDashboards(this.repository);

  Future<Either<Failure, List<DashboardEntity>>> call() async {
    return await repository.getAllDashboards();
  }
}

class GetDashboardById {
  final IDashboardRepository repository;

  GetDashboardById(this.repository);

  Future<Either<Failure, DashboardEntity?>> call(String dashboardId) async {
    return await repository.getDashboardById(dashboardId);
  }
}

class UpdateDashboard {
  final IDashboardRepository repository;

  UpdateDashboard(this.repository);

  Future<Either<Failure, void>> call(DashboardEntity dashboardEntity) async {
    return await repository.updateDashboard(dashboardEntity);
  }
}

class DeleteDashboard {
  final IDashboardRepository repository;

  DeleteDashboard(this.repository);

  Future<Either<Failure, void>> call(String dashboardId) async {
    return await repository.deleteDashboard(dashboardId);
  }
}
