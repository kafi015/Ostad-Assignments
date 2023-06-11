class Urls {
  static String baseUrl = 'https://task.teamrabbil.com/api/v1';
  static String loginUrl = '$baseUrl/login';
  static String registrationUrl = '$baseUrl/registration';
  static String createNewTaskUrl = '$baseUrl/createTask';
  static String getNewTaskUrl = '$baseUrl/listTaskByStatus/New';
  static String getCompletedTaskUrl = '$baseUrl/listTaskByStatus/Completed';
  static String getCanceledTaskUrl = '$baseUrl/listTaskByStatus/Canceled';
  static String getInProgressedTaskUrl = '$baseUrl/listTaskByStatus/InProgress';

  static String changeTaskStatus(String taskId, String status) =>
      '$baseUrl/updateTaskStatus/$taskId/$status';
}
