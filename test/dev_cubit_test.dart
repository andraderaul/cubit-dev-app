import 'package:dev_app/src/dev_cubit.dart';
import 'package:dev_app/src/dev_model.dart';
import 'package:dev_app/src/dev_repository.dart';
import 'package:dev_app/src/dev_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements DevRepository {}

void main() {
  MockRepository devRepository;
  DevCubit devCubit;

  final dev = DevModel(name: 'teste', avatarUrl: 'url teste');

  setUp(() {
    devRepository = MockRepository();
    when(devRepository.getDev()).thenAnswer((_) async => dev);

    devCubit = DevCubit(repository: devRepository);
  });

  test('Emits dev when repository answer corretly', () async {
    await expectLater(
      devCubit,
      emits(
        LoadedState(dev),
      ),
    );
  });
}
