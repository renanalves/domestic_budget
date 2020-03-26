import 'package:dio/dio.dart';
import 'package:domestic_budget_app/app/app_module.dart';
import 'package:domestic_budget_app/app/build_type.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_module.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_repository.dart';
import 'package:domestic_budget_app/app/shared/models/user_model.dart';
import 'package:domestic_budget_app/app/shared/services/local_storage_service.dart';
import 'package:domestic_budget_app/app/shared/util/http_api.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Dio {}

class MockLocalStorage extends Mock implements LocalStorageService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initModules([AppModule(), InitialModule()]);
  MockClient client;
  InitialRepository repository;
  MockLocalStorage mockLocalStorage;
  LocalStorageService localStorageService;

  setUp(() {
    client = MockClient();
    repository = InitialRepository.getInstance();
    mockLocalStorage = MockLocalStorage();
    localStorageService = LocalStorageService.getInstance();
    setup();
  });

  group('InitialRepository login test integration', () {
    test('login test integration', () async {
      final String identifier = 'renans.dasilva@gmail.com';
      final String password = 'aq1sw2';

      final tUser = UserModel(
        id: 1,
        username: 'ralves',
        email: 'renans.dasilva@gmail.com',
      );

      when(client.post('http://192.168.0.3:1337/auth/local', data: {
        'identifier': identifier,
        'password': password,
      })).thenAnswer(
        (_) async => Response(
          data: {
            'id': 1,
            'username': 'ralves',
            'email': 'renans.dasilva@gmail.com',
          },
        ),
      );
      UserModel response = await repository.login(identifier, password);
      String jwt = await localStorageService.getString('jwt');
      print(jwt);
      expect(response.email, tUser.email);
    });

    test('should return the saved jwt in the local storage', () async {
      when(mockLocalStorage.getString('jwt'))
          .thenAnswer((_) async => Future.value('jkdjskdjksajdklsdjkskas'));
      String jwt = await mockLocalStorage.getString('jwt');
      print(jwt);
    });
  });
}

void setup() {
  GetIt.I.registerLazySingleton<HttpApi>(() => HttpApi(BuildType.TEST));
}
