import 'package:wiso_cash/features/bloc/data/datasources/register_provider.dart';
import 'package:wiso_cash/features/bloc/data/models/index.dart';

abstract class repository {
  Future<RegisterModelTrue?> registerUser(var data, String url);
}

class DataRepository extends repository {
  final DataProvider dataProvider;

  DataRepository({
    required this.dataProvider,
  });

  @override
  Future<RegisterModelTrue?> registerUser(var data, String url) {
    final register = dataProvider.registerUser(data, url);

    return register;
  }

  Future<RegisterModelTrue?> envoieWallet(var data, String url) {
    final register = dataProvider.envoieWallet(data, url);

    return register;
  }
}
