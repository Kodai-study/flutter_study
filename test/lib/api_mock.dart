import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../api_book_searcher_test.dart';

void setDefaultResponse(DioAdapter dioAdapter, int itemCount) {
  dioAdapter.onGet("/volumes",
      (server) => server.reply(200, createSuccessResponse(itemCount).toJson()),
      queryParameters: {'q': 'item_$itemCount'});
}
