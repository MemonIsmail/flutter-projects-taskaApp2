class TaskDetailsModel{
  final String title;
  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final String description;

  TaskDetailsModel({
    required this.title,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.assignee,
    required this.description,
  });


  // Future<UserModel> getUserByName(String userName)async{
  //   final database = await AppDBClient(). InitializeDatabase();
  //   User user = database.userDao().findUserByName(userName);
  //   return UserModel.fromEntity(user);
  // }
}