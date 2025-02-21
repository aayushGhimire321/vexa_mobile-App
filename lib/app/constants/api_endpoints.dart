class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  static const String baseUrl = "https://vexa.onrender.com/api/";

  // ====================== Auth Routes ======================
  static const String signIn = "auth/signin";
  static const String signUp = "auth/signup";
  static const String googleSignIn = "auth/google";
  static const String findUserByEmail = "auth/findbyemail";
  static const String generateOtp = "auth/generateotp";
  static const String verifyOtp = "auth/verifyotp";
  static const String resetPassword = "auth/forgetpassword";

  // ====================== User Routes ======================
  static const String getUsers = "users/find";
  static const String searchUsers = "users/search/";
  static const String notifications = "users/notifications";
  static const String getProjects = "users/projects";
  static const String userWorks = "users/works";
  static const String userTasks = "users/tasks";

  // ====================== Project Routes ======================
  static const String createProject = "project/";
  static const String getProjectDetails = "project/";
  static const String inviteProjectMembers = "project/invite/";
  static const String addWorks = "project/works/";
  static const String getWorks = "project/works/";
  static const String verifyProjectInvite = "project/invite/";
  static const String updateProject = "project/";
  static const String deleteProject = "project/";
  static const String updateMembers = "project/member/";
  static const String removeMembers = "project/member/remove/";

  // ====================== Team Routes ======================
  static const String createTeam = "team/";
  static const String getTeams = "team/";
  static const String inviteTeamMembers = "team/invite/";
  static const String addTeamProject = "team/addProject/";
  static const String verifyTeamInvite = "team/invite/";
  static const String updateTeam = "team/";
  static const String deleteTeam = "team/";
  static const String updateTeamMembers = "team/member/";
  static const String removeTeamMembers = "team/member/remove/";
}
