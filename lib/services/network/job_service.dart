import 'package:dio/dio.dart';
import 'package:offertelavoroflutter_app/services/network/dto/notion_response.dart';
import 'package:retrofit/retrofit.dart';

part 'job_service.g.dart';

@RestApi()
abstract class JobService {
  factory JobService(
    Dio dio, {
    String baseUrl,
  }) = _JobService;

  @POST("/283d2760f81548f0a7baca4b3e58d7d8/query")
  Future<NotionResponse> all();
}
