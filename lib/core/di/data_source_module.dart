import 'package:injectable/injectable.dart';
import 'package:plantapp_case/features/home/data/datasources/home_mock_data_source.dart';
import 'package:plantapp_case/features/home/data/datasources/home_remote_data_source.dart';

@module
abstract class DataSourceModule {
  // Use mock data source by default for demo purposes
  @LazySingleton(as: HomeRemoteDataSource)
  HomeMockDataSource get mockDataSource => HomeMockDataSource();

  // Comment out the remote data source to use mock
  // @LazySingleton(as: HomeRemoteDataSource)
  // HomeRemoteDataSourceImpl get remoteDataSource => HomeRemoteDataSourceImpl();
}
