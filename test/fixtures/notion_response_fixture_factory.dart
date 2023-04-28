import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/notion_response.dart';

import 'job_dto_fixture_factory.dart';

extension NotionResponseFixture on NotionResponse {
  static NotionResponseFixtureFactory factory() =>
      NotionResponseFixtureFactory();
}

class NotionResponseFixtureFactory extends JsonFixtureFactory<NotionResponse> {
  @override
  FixtureDefinition<NotionResponse> definition() => define(
        (faker) => NotionResponse(
          object: "list",
          results: JobDTOFixture.factory().makeMany(3),
          nextCursor: null,
          hasMore: false,
          type: "page",
          page: {},
        ),
      );

  @override
  JsonFixtureDefinition<NotionResponse> jsonDefinition() => defineJson(
        (object) => {
          K.objectKey: object.object,
          K.resultsKey:
              JobDTOFixture.factory().makeJsonArrayFromMany(object.results),
          K.nextCursorKey: object.nextCursor,
          K.hasMoreKey: object.hasMore,
          K.typeKey: object.type,
          K.pageKey: object.page,
        },
      );
}
