import 'package:taska_app/database/services/web/urls.dart';

import '../../../model/task_details_model.dart';
import 'http_client.dart';

class WebTaskServices {

  static final WebTaskServices _instance = WebTaskServices._private();

  WebTaskServices._private();

  factory WebTaskServices(){
    return _instance;
  }

  Future<List<TaskDetailsModel>> getTasks(int id) async {
    List<TaskDetailsModel> allTasks = [];
    Map<String, dynamic> response = await HTTPClient().getRequest(url: kGetTasksURL);
    if(response.isNotEmpty && response['data'] != null){
      for(var t in response['data']['todos']  ?? []){
        TaskDetailsModel task = TaskDetailsModel.fromJson(t);
        if(task.userId == id) {
          allTasks.add(task);
        }
      }
    }
    return allTasks;
  }

}