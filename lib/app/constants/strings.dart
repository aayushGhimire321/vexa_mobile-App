class AppStrings {
  static const String appName = 'Vexa-The Project Management App';
  static const String skip = "Skip";
  static const String next = "Next";
  static const String getStarted = "Get Started";

  static const String splashLogo = 'assets/logo/Logo.png';


  static const List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Welcome to Vexa",
      "description": "Discover a seamless way to connect and share ideas.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Collaborate Efficiently",
      "description": "Work together with your team in real time.",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Achieve Your Goals",
      "description": "Stay organized and accomplish tasks effectively.",
    },
  ];
  static const String loginImage = 'assets/images/login.png';
  static const String registerImage = 'assets/images/register.png';

  static const String resetPasswordTitle = 'Reset Your Password';
  static const String resetPasswordDescription = 'Enter your registered email address. We will send you a link to reset your password.';
  static const String emailLabel = 'Email';
  static const String sendResetLinkButton = 'Send Reset Link';
  static const String successMessage = 'Password reset link sent to';
  static const String errorMessage = 'Please enter a valid email address';
  static const String genericErrorMessage = 'Something went wrong. Please try again later.';

  static const String dashboardTitle = "Dashboard";

  // Stat Card Titles
  static const String totalProjectsTitle = "Total Projects Done";
  static const String totalProjectsSubtitle = "Working on 0 projects";
  static const String totalTasksTitle = "Total Task Done";
  static const String totalTasksSubtitle = "0 Tasks are left";

  // Action Button Titles
  static const String createNewProject = "Create New Project";
  static const String createNewTeam = "Create New Team";

  // Recent Projects Section
  static const String recentProjectsTitle = "Recent Projects";
  static const String noProjectsAvailable = "No projects available";

  // Error Messages
  static const String featureNotImplemented = "Feature not implemented yet.";
  static const String failedToLoadData = "Failed to load dashboard data.";
}

