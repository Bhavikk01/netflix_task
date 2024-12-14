import 'dart:developer';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  static ApiClient get to => Get.find();

  getAllShows({required Function(Response res) onSuccess,
        required Function(Response error) onError}) async {
    // try {
      log('============== Calling API: https://api.tvmaze.com/search/shows?q=all ===================');
      Response res = await httpClient.get(
        'https://api.tvmaze.com/search/shows?q=all',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(
          Response(
            statusCode: res.statusCode,
            body: {'error': 'Unhealthy Response'},
          ),
        );
      }
    // } catch (err) {
    //   onError(
    //     Response(
    //       statusCode: 404,
    //       body: {'error': '$err'},
    //     ),
    //   );
    // }
  }

  bool validateResponse(res) {
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  searchShow(String search,
      {required Function(Response res) onSuccess,
        required Function(Response error) onError}) async {
    try {
      log('------------- Calling API: https://api.tvmaze.com/search/shows?q=$search --------------');
      log('================================ Data Sending ==========================================');
      Response res = await httpClient.get(
        'https://api.tvmaze.com/search/shows?q=$search',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(
          Response(
            statusCode: res.statusCode,
            body: {'error': 'Unhealthy Response'},
          ),
        );
      }
    } catch (err) {
      onError(
        Response(
          statusCode: 404,
          body: {'error': '$err'},
        ),
      );
    }
  }

}
