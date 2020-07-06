import 'package:dio/dio.dart';

import 'dev_model.dart';

class DevRepository {
  DevRepository(this.client);

  final Dio client;

  Future<DevModel> getDev() async {
    try {
      final url = 'https://api.github.com/users/andraderaul';

      final response = await client.get(url);

      final dev = DevModel(
          name: response.data['name'], avatarUrl: response.data['avatar_url']);

      return dev;
    } catch (e) {
      throw e;
    }
  }
}
