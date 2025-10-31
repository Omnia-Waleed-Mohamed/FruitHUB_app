


abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? dId,
  });


  Future<Map<String, dynamic>?> getData({
    required String path,
    required String dId,
  });

  
}
