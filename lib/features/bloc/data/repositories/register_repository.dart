import 'package:wiso_cash/features/bloc/data/datasources/register_provider.dart';
import 'package:wiso_cash/features/bloc/data/models/model1/index.dart';

abstract class repository {
  Future<RegisterModelTrue?> registerUser(var data, String url);
  //Future<void> socket(var data);
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

  Future<RegisterModelTrue?> socket(var dat) async {
    final rep = await dataProvider.socket(dat);

    return rep;
  }
}
