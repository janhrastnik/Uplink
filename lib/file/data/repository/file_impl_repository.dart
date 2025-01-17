import 'package:uplink/file/data/data_export.dart';
import 'package:uplink/file/domain/item.dart';

class FileRepositoryImpl implements IFileRepository {
  FileRepositoryImpl(this._fileApi);

  final IFileApi _fileApi;

  @override
  Future<List<Item>> getItemList() => _fileApi.getItemList();
}
