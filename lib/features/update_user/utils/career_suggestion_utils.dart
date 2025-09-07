import 'package:edtech_app/bootstrap.dart';

class CareerSuggestion {
  final String personalityType;
  final String description;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> careerSuggestions;

  CareerSuggestion({
    required this.personalityType,
    required this.description,
    required this.strengths,
    required this.weaknesses,
    required this.careerSuggestions,
  });
}

class MastersDegreeCareerSuggestion {
  final String personalityType;
  final String analysisDescription;
  final String psychologicalDescription;
  final List<String> bestPrograms;
  final List<String> industries;

  MastersDegreeCareerSuggestion({
    required this.personalityType,
    required this.analysisDescription,
    required this.psychologicalDescription,
    required this.bestPrograms,
    required this.industries,
  });
}

class CareerSuggestionUtils {
  static CareerSuggestion? getCareerSuggestion(Map<String, String> answers) {
    talker.debug("=== CAREER SUGGESTION ALGORITHM DEBUG START ===");
    talker.debug("Input answers: $answers");
    talker.debug("Total input answers: ${answers.length}");

    final scores = _calculatePersonalityScores(answers);
    talker.debug("Calculated personality scores: $scores");

    final personalityType = _determinePersonalityType(scores);
    talker.debug("Determined personality type: $personalityType");

    final suggestion = _getCareerSuggestionForType(personalityType);
    talker.debug("Final career suggestion: ${suggestion.personalityType}");
    talker.debug("=== CAREER SUGGESTION ALGORITHM DEBUG END ===");

    return suggestion;
  }

  static MastersDegreeCareerSuggestion? getMastersDegreeCareerSuggestion(
      Map<String, String> answers) {
    talker.debug("=== MASTERS CAREER SUGGESTION DEBUG START ===");
    talker.debug("Input answers: $answers");
    talker.debug("Total input answers: ${answers.length}");

    final scores = _calculatePersonalityScores(answers);
    talker.debug("Calculated personality scores for masters: $scores");

    final personalityType = _determineMastersPersonalityType(scores);
    talker.debug("Determined masters personality type: $personalityType");

    final suggestion = _getMastersCareerSuggestionForType(personalityType);
    talker.debug("Final masters career suggestion: ${suggestion.personalityType}");
    talker.debug("=== MASTERS CAREER SUGGESTION DEBUG END ===");

    return suggestion;
  }

  static Map<String, double> _calculatePersonalityScores(Map<String, String> answers) {
    Map<String, double> scores = {
      'analytical': 0.0,
      'creative': 0.0,
      'technical': 0.0,
      'people': 0.0,
      'structured': 0.0,
      'flexible': 0.0,
      'independent': 0.0,
      'collaborative': 0.0,
      'practical': 0.0,
      'theoretical': 0.0,
    };

    // Analytical vs Creative scoring
    _scoreAnalyticalVsCreative(answers, scores);

    // Technical vs People-oriented scoring
    _scoreTechnicalVsPeople(answers, scores);

    // Structured vs Flexible scoring
    _scoreStructuredVsFlexible(answers, scores);

    // Independent vs Collaborative scoring
    _scoreIndependentVsCollaborative(answers, scores);

    // Practical vs Theoretical scoring
    _scorePracticalVsTheoretical(answers, scores);

    return scores;
  }

  static void _scoreAnalyticalVsCreative(Map<String, String> answers, Map<String, double> scores) {
    // Q1: Activity preference
    if (answers['activityEnjoy'] == 'Solving puzzles')
      scores['analytical'] = scores['analytical']! + 2.0;
    if (answers['activityEnjoy'] == 'Writing stories')
      scores['creative'] = scores['creative']! + 2.0;
    if (answers['activityEnjoy'] == 'Building things')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['activityEnjoy'] == 'Helping people') scores['people'] = scores['people']! + 1.0;

    // Q2: Challenge preference
    if (answers['whatKindOfChallengesExciteYou'] == 'Logical problems')
      scores['analytical'] = scores['analytical']! + 2.0;
    if (answers['whatKindOfChallengesExciteYou'] == 'Expressing creativity')
      scores['creative'] = scores['creative']! + 2.0;
    if (answers['whatKindOfChallengesExciteYou'] == 'Fixing broken things')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['whatKindOfChallengesExciteYou'] == 'Supporting others')
      scores['people'] = scores['people']! + 1.0;

    // Q5: Natural abilities
    if (answers['whatComesNaturallyToYou'] == 'Finding patterns')
      scores['analytical'] = scores['analytical']! + 2.0;
    if (answers['whatComesNaturallyToYou'] == 'Storytelling')
      scores['creative'] = scores['creative']! + 2.0;
    if (answers['whatComesNaturallyToYou'] == 'Designing or fixing')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['whatComesNaturallyToYou'] == 'Motivating others')
      scores['people'] = scores['people']! + 1.0;

    // Q8: Problem approach
    if (answers['howDoYouApproachProblems'] == 'With logic and calculations')
      scores['analytical'] = scores['analytical']! + 2.0;
    if (answers['howDoYouApproachProblems'] == 'Thinking outside the box')
      scores['creative'] = scores['creative']! + 2.0;
    if (answers['howDoYouApproachProblems'] == 'Hands-on solutions')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['howDoYouApproachProblems'] == 'Empathy and understanding')
      scores['people'] = scores['people']! + 1.0;

    // Q9: Best skills
    if (answers['whichSkillAreYouBestAt'] == 'Analysing and calculating')
      scores['analytical'] = scores['analytical']! + 2.0;
    if (answers['whichSkillAreYouBestAt'] == 'Writing or designing')
      scores['creative'] = scores['creative']! + 2.0;
    if (answers['whichSkillAreYouBestAt'] == 'Building or fixing')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['whichSkillAreYouBestAt'] == 'Communicationg and leading')
      scores['people'] = scores['people']! + 1.0;

    // Q10: Career motivation
    if (answers['whatMotivatesYouMostInACareer'] == 'Critical thinking')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['whatMotivatesYouMostInACareer'] == 'Creative expression')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['whatMotivatesYouMostInACareer'] == 'Practical skills')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['whatMotivatesYouMostInACareer'] == 'Making a difference')
      scores['people'] = scores['people']! + 1.0;
  }

  static void _scoreTechnicalVsPeople(Map<String, String> answers, Map<String, double> scores) {
    // Q3: Work preference
    if (answers['doYouPreferWorkingWith'] == 'Numbers')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['doYouPreferWorkingWith'] == 'Words')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['doYouPreferWorkingWith'] == 'Tools & Materials')
      scores['technical'] = scores['technical']! + 2.0;
    if (answers['doYouPreferWorkingWith'] == 'People') scores['people'] = scores['people']! + 2.0;

    // Q7: Work environment
    if (answers['whatKindOfWorkEnvironmentSuitsYou'] == 'A quiet office')
      scores['independent'] = scores['independent']! + 1.0;
    if (answers['whatKindOfWorkEnvironmentSuitsYou'] == 'A creative space')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['whatKindOfWorkEnvironmentSuitsYou'] == 'A lab or workshop')
      scores['technical'] = scores['technical']! + 2.0;
    if (answers['whatKindOfWorkEnvironmentSuitsYou'] == 'A community/outdoor setting')
      scores['people'] = scores['people']! + 2.0;

    // Q19-24: Interest areas
    if (answers['doYouEnjoyWorkingWithTechnology'] == 'Yes')
      scores['technical'] = scores['technical']! + 2.0;
    if (answers['areYouInterestedInHealthcareOrMedicine'] == 'Yes')
      scores['people'] = scores['people']! + 1.5;
    if (answers['wouldYouLikeToWorkInEducationOrTeaching'] == 'Yes')
      scores['people'] = scores['people']! + 2.0;
    if (answers['doYouEnjoyResearchAndAnalysis'] == 'Yes')
      scores['analytical'] = scores['analytical']! + 1.5;
    if (answers['areYouInterestedInPsychologyOrCounseling'] == 'Yes')
      scores['people'] = scores['people']! + 2.0;
    if (answers['wouldYouLikeACareerInMediaOrFilmOrEntertainment'] == 'Yes')
      scores['creative'] = scores['creative']! + 1.5;
  }

  static void _scoreStructuredVsFlexible(Map<String, String> answers, Map<String, double> scores) {
    // Q14: Deadline preference
    if (answers['howDoYouFeelAboutDeadlines'] == 'I thrive under them')
      scores['structured'] = scores['structured']! + 2.0;
    if (answers['howDoYouFeelAboutDeadlines'] == 'I prefer flexibility')
      scores['flexible'] = scores['flexible']! + 2.0;
    if (answers['howDoYouFeelAboutDeadlines'] == 'I like structured timelines')
      scores['structured'] = scores['structured']! + 1.0;
    if (answers['howDoYouFeelAboutDeadlines'] == 'I focus more on people than time')
      scores['people'] = scores['people']! + 1.0;

    // Q15: Job structure preference
    if (answers['whatKindOfJobStructureDoYouPrefer'] == 'Well-defined')
      scores['structured'] = scores['structured']! + 2.0;
    if (answers['whatKindOfJobStructureDoYouPrefer'] == 'Creative and flexible')
      scores['flexible'] = scores['flexible']! + 2.0;
    if (answers['whatKindOfJobStructureDoYouPrefer'] == 'Technical and active')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['whatKindOfJobStructureDoYouPrefer'] == 'People-centered with variety')
      scores['people'] = scores['people']! + 1.0;

    // Q27: Employer preference
    if (answers['whatKindOfEmployerDoYouPrefer'] == 'Big company')
      scores['structured'] = scores['structured']! + 1.0;
    if (answers['whatKindOfEmployerDoYouPrefer'] == 'Your own business')
      scores['flexible'] = scores['flexible']! + 1.0;

    // Q30: Work style
    if (answers['doYouPrefer'] == 'Precision and routine')
      scores['structured'] = scores['structured']! + 2.0;
    if (answers['doYouPrefer'] == 'Creativity and flexibility')
      scores['flexible'] = scores['flexible']! + 2.0;
  }

  static void _scoreIndependentVsCollaborative(
      Map<String, String> answers, Map<String, double> scores) {
    // Q11: Work preference
    if (answers['doYouPreferWorking'] == 'Alone')
      scores['independent'] = scores['independent']! + 2.0;
    if (answers['doYouPreferWorking'] == 'In a team to brainstorm')
      scores['collaborative'] = scores['collaborative']! + 2.0;
    if (answers['doYouPreferWorking'] == 'Alone or in a team based on task')
      scores['flexible'] = scores['flexible']! + 1.0;
    if (answers['doYouPreferWorking'] == 'In a team where you can lead') {
      scores['collaborative'] = scores['collaborative']! + 1.0;
      scores['people'] = scores['people']! + 1.0;
    }

    // Q29: Leadership style
    if (answers['areYouMoreOfA'] == 'Leader')
      scores['collaborative'] = scores['collaborative']! + 1.0;
    if (answers['areYouMoreOfA'] == 'Team player')
      scores['collaborative'] = scores['collaborative']! + 2.0;
  }

  static void _scorePracticalVsTheoretical(
      Map<String, String> answers, Map<String, double> scores) {
    // Q6: Subject preference
    if (answers['whichSubjectWouldYouEnjoyTheMost'] == 'Mathematics')
      scores['theoretical'] = scores['theoretical']! + 1.0;
    if (answers['whichSubjectWouldYouEnjoyTheMost'] == 'Languages')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['whichSubjectWouldYouEnjoyTheMost'] == 'Sciences')
      scores['theoretical'] = scores['theoretical']! + 2.0;
    if (answers['whichSubjectWouldYouEnjoyTheMost'] == 'Social Sciences')
      scores['people'] = scores['people']! + 1.0;

    // Q17: Travel for work
    if (answers['wouldYouLikeToTravelForWork'] == 'No')
      scores['structured'] = scores['structured']! + 1.0;
    if (answers['wouldYouLikeToTravelForWork'] == 'Yes, for cultural/artistic reasons')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['wouldYouLikeToTravelForWork'] == 'Yes, for technical projects')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['wouldYouLikeToTravelForWork'] == 'Yes, to serve communities')
      scores['people'] = scores['people']! + 1.0;

    // Q18: Job happiness
    if (answers['whatWouldMakeYouHappiestInAJob'] == 'Intellectual challenges')
      scores['theoretical'] = scores['theoretical']! + 2.0;
    if (answers['whatWouldMakeYouHappiestInAJob'] == 'Creative freedom')
      scores['creative'] = scores['creative']! + 2.0;
    if (answers['whatWouldMakeYouHappiestInAJob'] == 'Technical tasks')
      scores['practical'] = scores['practical']! + 2.0;

    // Additional scoring for comprehensive coverage
    // Q4: Free time activities
    if (answers['whatDoYouEnjoyDoingInYourFreeTime'] == 'Playing strategy games')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['whatDoYouEnjoyDoingInYourFreeTime'] == 'Reading or writing')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['whatDoYouEnjoyDoingInYourFreeTime'] == 'DIY projects')
      scores['practical'] = scores['practical']! + 1.0;
    if (answers['whatDoYouEnjoyDoingInYourFreeTime'] == 'Guiding others')
      scores['people'] = scores['people']! + 1.0;

    // Q12: Job tasks preference
    if (answers['doYouLikeJobsThatInvolve'] == 'Problem-solving')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['doYouLikeJobsThatInvolve'] == 'Creativity')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['doYouLikeJobsThatInvolve'] == 'Hands-on tasks')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['doYouLikeJobsThatInvolve'] == 'Managing/helping people')
      scores['people'] = scores['people']! + 1.0;

    // Q13: Task preference
    if (answers['wouldYouRather'] == 'Analyze data')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['wouldYouRather'] == 'Write or design')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['wouldYouRather'] == 'Invent or fix things')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['wouldYouRather'] == 'Understand and help people')
      scores['people'] = scores['people']! + 1.0;

    // Q16: Career activities
    if (answers['wouldYouEnjoyACareerWhereYou'] == 'Solve problems')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['wouldYouEnjoyACareerWhereYou'] == 'Create something new')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['wouldYouEnjoyACareerWhereYou'] == 'Work with machines')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['wouldYouEnjoyACareerWhereYou'] == 'Support and guide others')
      scores['people'] = scores['people']! + 1.0;

    // Q25: Job values
    if (answers['whatIsMoreImportantToYouInAJob'] == 'High salary')
      scores['structured'] = scores['structured']! + 1.0;
    if (answers['whatIsMoreImportantToYouInAJob'] == 'Satisfaction')
      scores['flexible'] = scores['flexible']! + 1.0;
    if (answers['whatIsMoreImportantToYouInAJob'] == 'Security')
      scores['structured'] = scores['structured']! + 1.0;
    if (answers['whatIsMoreImportantToYouInAJob'] == 'Growth')
      scores['flexible'] = scores['flexible']! + 1.0;

    // Q26: Task preference again
    if (answers['wouldYouRatherDo'] == 'Solve logical problems')
      scores['analytical'] = scores['analytical']! + 1.0;
    if (answers['wouldYouRatherDo'] == 'Create/write')
      scores['creative'] = scores['creative']! + 1.0;
    if (answers['wouldYouRatherDo'] == 'Build/repair')
      scores['technical'] = scores['technical']! + 1.0;
    if (answers['wouldYouRatherDo'] == 'Counsel/support others')
      scores['people'] = scores['people']! + 1.0;

    // Q28: Work location preference
    if (answers['whereWouldYouRatherWork'] == 'Indoors')
      scores['structured'] = scores['structured']! + 0.5;
    if (answers['whereWouldYouRatherWork'] == 'Outdoors')
      scores['flexible'] = scores['flexible']! + 0.5;
  }

  static String _determinePersonalityType(Map<String, double> scores) {
    // Determine dominant traits
    double maxAnalytical = scores['analytical'] ?? 0.0;
    double maxCreative = scores['creative'] ?? 0.0;
    double maxTechnical = scores['technical'] ?? 0.0;
    double maxPeople = scores['people'] ?? 0.0;

    // Primary dimension: What drives them most?
    bool isAnalytical = maxAnalytical >= 6.0;
    bool isCreative = maxCreative >= 6.0;
    bool isTechnical = maxTechnical >= 6.0;
    bool isPeopleOriented = maxPeople >= 6.0;

    // Secondary traits
    bool isCollaborative = (scores['collaborative'] ?? 0.0) > (scores['independent'] ?? 0.0);

    // Determine personality type based on combinations
    if (isAnalytical && isTechnical) {
      return "The Builder-Scientist";
    } else if (isAnalytical && isPeopleOriented) {
      return "The Knowledge Explorer";
    } else if (isAnalytical && isCreative) {
      return "The Analytical Creator";
    } else if (isCreative && isTechnical) {
      return "The Creative Engineer";
    } else if (isCreative && isPeopleOriented) {
      return "The Visionary Storyteller";
    } else if (isPeopleOriented && isCollaborative) {
      return "The Social Leader";
    } else if (isPeopleOriented && !isTechnical) {
      return "The Human-Centered Thinker";
    } else if (isPeopleOriented) {
      return "The Caring Educator";
    } else if (isAnalytical) {
      return "The Knowledge Explorer";
    } else if (isCreative) {
      return "The Visionary Storyteller";
    } else if (isTechnical) {
      return "The Builder-Scientist";
    } else {
      return "The Balanced Pragmatist";
    }
  }

  static String _determineMastersPersonalityType(Map<String, double> scores) {
    double maxAnalytical = scores['analytical'] ?? 0.0;
    double maxCreative = scores['creative'] ?? 0.0;
    double maxTechnical = scores['technical'] ?? 0.0;
    double maxPeople = scores['people'] ?? 0.0;

    bool isHighAnalytical = maxAnalytical >= 6.0;
    bool isHighCreative = maxCreative >= 6.0;
    bool isHighTechnical = maxTechnical >= 6.0;
    bool isHighPeople = maxPeople >= 6.0;

    if (isHighAnalytical && isHighTechnical) {
      if (maxTechnical >= 8.0) return "The Tech-Engineer Builder";
      if (maxAnalytical >= 8.0) return "The Data-Driven Innovator";
      return "The Finance Quant";
    } else if (isHighCreative && isHighTechnical) {
      return "The Creative Tech Designer";
    } else if (isHighPeople && isHighCreative) {
      return "The Social Impact Innovator";
    } else if (isHighPeople && maxAnalytical >= 4.0) {
      return "The Healthcare Strategist";
    } else if (isHighAnalytical && maxPeople >= 4.0) {
      return "The Policy & Law Analyst";
    } else if (maxTechnical >= 5.0 && (scores['structured'] ?? 0.0) >= 3.0) {
      return "The Petroleum & Energy Specialist";
    } else if (isHighPeople || (maxPeople >= 4.0 && maxCreative >= 4.0)) {
      return "The Sustainability Architect";
    } else if (isHighAnalytical || maxAnalytical >= 5.0) {
      return "The Finance Quant";
    } else {
      return "The Global Business Leader";
    }
  }

  static CareerSuggestion _getCareerSuggestionForType(String type) {
    final careerMap = {
      "The Analytical Creator": CareerSuggestion(
        personalityType: "The Analytical Creator",
        description:
            "You balance logic with creativity. You enjoy solving puzzles but also like expressing yourself through design or writing. You thrive in problem-solving but may sometimes overthink and struggle with structure.",
        strengths: [
          "Strong analytical reasoning",
          "Creative thinking",
          "Ability to generate innovative solutions"
        ],
        weaknesses: ["Can get lost in ideas without execution", "Struggles with deadlines"],
        careerSuggestions: [
          "Data Analyst with storytelling focus",
          "UX Designer",
          "Market Researcher",
          "Creative Strategist",
          "Innovation Consultant"
        ],
      ),
      "The Human-Centered Thinker": CareerSuggestion(
        personalityType: "The Human-Centered Thinker",
        description:
            "You enjoy helping others and excel in understanding people. Communication is natural for you, and you like to motivate. However, you may avoid highly technical or isolated tasks.",
        strengths: ["Empathy", "Leadership", "Communication", "Ability to connect with people"],
        weaknesses: ["Can be overly people-pleasing", "Less comfortable with technical detail"],
        careerSuggestions: [
          "Psychologist / Counselor",
          "HR Manager",
          "Teacher / Educator",
          "Community Development Officer",
          "Public Relations Manager"
        ],
      ),
      "The Builder-Scientist": CareerSuggestion(
        personalityType: "The Builder-Scientist",
        description:
            "You like to fix, build, and create tangible outcomes. You prefer structured, technical environments and may dislike vague or overly flexible roles.",
        strengths: ["Hands-on skills", "Logical problem-solving", "Structured thinking"],
        weaknesses: ["May struggle with abstract concepts or highly people-focused roles"],
        careerSuggestions: [
          "Engineer (Mechanical, Civil, Robotics)",
          "Lab Technician",
          "Architect",
          "Product Designer",
          "Technical Specialist"
        ],
      ),
      "The Knowledge Explorer": CareerSuggestion(
        personalityType: "The Knowledge Explorer",
        description:
            "You are curious and driven by intellectual challenges. You prefer research, analysis, and learning. Social roles may feel draining, but you thrive in problem-solving contexts.",
        strengths: ["Research-oriented", "Analytical", "Detail-focused"],
        weaknesses: ["May struggle with leadership or creativity-heavy roles"],
        careerSuggestions: [
          "Economist",
          "Statistician",
          "Academic Researcher",
          "Business Intelligence Analyst",
          "Policy Advisor"
        ],
      ),
      "The Visionary Storyteller": CareerSuggestion(
        personalityType: "The Visionary Storyteller",
        description:
            "You love storytelling, design, and communication. You thrive in expressive roles and dislike overly rigid structures. Sometimes, you may struggle with deadlines.",
        strengths: ["Creativity", "Imagination", "Communication"],
        weaknesses: ["Lack of structure", "Struggles with repetitive work"],
        careerSuggestions: [
          "Writer / Journalist",
          "Graphic Designer",
          "Content Creator",
          "Advertising / Marketing Specialist",
          "Film & Media Professional"
        ],
      ),
      "The Social Leader": CareerSuggestion(
        personalityType: "The Social Leader",
        description:
            "You enjoy guiding others, leading teams, and making an impact. You are extroverted and thrive in people-centered environments.",
        strengths: ["Leadership", "Communication", "Motivation"],
        weaknesses: ["Can become impatient with detailed or technical tasks"],
        careerSuggestions: [
          "Corporate Manager",
          "Politician",
          "NGO Leader",
          "Event Manager",
          "Corporate Trainer"
        ],
      ),
      "The Creative Engineer": CareerSuggestion(
        personalityType: "The Creative Engineer",
        description:
            "You enjoy both designing and building. You combine creativity with technical knowledge, making you strong in innovation. Sometimes, you may get stuck in experimentation without finishing.",
        strengths: ["Innovation", "Technical knowledge", "Creative problem-solving"],
        weaknesses: ["May lack patience for detailed analysis", "Struggles with monotony"],
        careerSuggestions: [
          "Product Engineer",
          "Industrial Designer",
          "Game Developer",
          "Robotics Engineer",
          "R&D Specialist"
        ],
      ),
      "The Caring Educator": CareerSuggestion(
        personalityType: "The Caring Educator",
        description:
            "You enjoy guiding, teaching, and helping others improve. You prefer community-based roles with a strong human touch.",
        strengths: ["Empathy", "Teaching", "Ability to simplify complex ideas"],
        weaknesses: ["May lack technical focus", "Can be emotionally drained"],
        careerSuggestions: [
          "Teacher / Professor",
          "Career Counselor",
          "Social Worker",
          "Training & Development Specialist",
          "Child Psychologist"
        ],
      ),
    };

    return careerMap[type] ??
        CareerSuggestion(
          personalityType: "The Balanced Pragmatist",
          description:
              "You combine logical reasoning with empathy and teamwork. You can adapt between analytical and social settings but may struggle to specialize deeply.",
          strengths: ["Adaptability", "Balanced skills", "Collaborative problem-solving"],
          weaknesses: ["Risk of being 'jack of all trades'"],
          careerSuggestions: [
            "Business Analyst",
            "Management Consultant",
            "Operations Manager",
            "Corporate Strategist",
            "Market Researcher"
          ],
        );
  }

  static MastersDegreeCareerSuggestion _getMastersCareerSuggestionForType(String type) {
    final mastersMap = {
      "The Data-Driven Innovator": MastersDegreeCareerSuggestion(
        personalityType: "The Data-Driven Innovator",
        analysisDescription:
            "Thinking: Analytical + Strategic\nWork Preference: Research + Technology\nMotivation: Innovation + Impact\nStrengths: Data Handling + Problem Solving\nInterest: IT, AI, Analytics",
        psychologicalDescription:
            "This personality thrives on structured analysis, large datasets, and using technology to drive innovation. They balance logic with creativity to find new solutions.",
        bestPrograms: [
          "MSc in Data Science / Business Analytics",
          "M.Tech in Artificial Intelligence / Machine Learning",
          "MBA in Business Analytics / Information Systems"
        ],
        industries: [
          "IT services",
          "Consulting",
          "FinTech",
          "AI Startups",
          "Manufacturing (automation)"
        ],
      ),
      "The Tech-Engineer Builder": MastersDegreeCareerSuggestion(
        personalityType: "The Tech-Engineer Builder",
        analysisDescription:
            "Thinking: Practical + Analytical\nWork: Lab + Technology\nMotivation: Stability + Innovation\nStrengths: Design + Problem Solving\nInterest: Engineering, Petroleum, Infrastructure",
        psychologicalDescription:
            "Hands-on, loves designing systems and building solutions. They excel in engineering challenges and prefer tangible results.",
        bestPrograms: [
          "M.Tech in Mechanical, Civil, Electrical, Petroleum, Chemical Engineering",
          "MSc in Energy Engineering / Robotics",
          "MBA in Operations / Supply Chain"
        ],
        industries: [
          "Oil & Gas",
          "Renewable Energy",
          "Aerospace",
          "Robotics",
          "Infrastructure",
          "Automobiles"
        ],
      ),
      "The Creative Tech Designer": MastersDegreeCareerSuggestion(
        personalityType: "The Creative Tech Designer",
        analysisDescription:
            "Thinking: Creative + Analytical\nWork: Design + Technology\nMotivation: Innovation + Recognition\nStrengths: Design + Problem Solving\nInterest: IT, Media, Arts, Gaming",
        psychologicalDescription:
            "Loves blending technology and creativity. They thrive in digital product design, UX/UI, gaming, and immersive technologies.",
        bestPrograms: [
          "MSc in Human-Computer Interaction",
          "M.Des in Product / Graphic / Game Design",
          "MA in Digital Media / Animation"
        ],
        industries: ["Gaming", "EdTech", "Creative AI", "UI/UX", "Film/Media", "AR/VR"],
      ),
      "The Healthcare Strategist": MastersDegreeCareerSuggestion(
        personalityType: "The Healthcare Strategist",
        analysisDescription:
            "Thinking: Empathetic + Analytical\nWork: People + Research\nMotivation: Impact + Stability\nStrengths: Communication + Data Handling\nInterest: Healthcare, Psychology, Public Health",
        psychologicalDescription:
            "Balances empathy with research-driven decisions. Interested in improving health systems, patient care, or mental well-being.",
        bestPrograms: [
          "Master of Public Health (MPH)",
          "MSc in Health Informatics / Biotechnology",
          "MA in Psychology / Counseling",
          "MBA in Healthcare Management",
          "MBBS → MD/MS (for clinical paths)"
        ],
        industries: [
          "Hospitals",
          "Pharma",
          "Health-Tech",
          "Mental Health Counseling",
          "Bioinformatics"
        ],
      ),
      "The Finance Quant": MastersDegreeCareerSuggestion(
        personalityType: "The Finance Quant",
        analysisDescription:
            "Thinking: Analytical + Strategic\nWork: Research + Management\nMotivation: Money + Innovation\nStrengths: Data + Problem Solving\nInterest: Finance, Economics, Markets",
        psychologicalDescription:
            "Loves numbers, thrives on risk models, and market predictions. Prefers structured, high-stakes problem-solving.",
        bestPrograms: [
          "MSc in Finance / Quantitative Finance",
          "M.Com in Banking & Insurance",
          "MBA in Finance"
        ],
        industries: ["Hedge Funds", "Investment Banking", "FinTech", "Consulting"],
      ),
      "The Policy & Law Analyst": MastersDegreeCareerSuggestion(
        personalityType: "The Policy & Law Analyst",
        analysisDescription:
            "Thinking: Strategic + Analytical\nWork: People + Research\nMotivation: Impact + Stability\nStrengths: Communication + Data\nInterest: Policy, Law, Governance",
        psychologicalDescription:
            "A natural policy shaper. Skilled in analyzing laws and their effects on society, they blend logic with ethical reasoning.",
        bestPrograms: [
          "MA in Public Policy / Political Science",
          "LLM (for Law graduates)",
          "MSc in Tech Policy / Governance",
          "MBA in Public Administration"
        ],
        industries: ["Government", "Think Tanks", "Legal-Tech", "UN/NGOs", "Compliance"],
      ),
      "The Petroleum & Energy Specialist": MastersDegreeCareerSuggestion(
        personalityType: "The Petroleum & Energy Specialist",
        analysisDescription:
            "Thinking: Practical + Analytical\nWork: Lab + Field\nMotivation: Stability + Money\nStrengths: Problem Solving + Technical\nInterest: Petroleum, Mining, Energy",
        psychologicalDescription:
            "Likes working with tangible resources and complex engineering processes. Motivated by stability and global energy demand.",
        bestPrograms: [
          "M.Tech in Petroleum Engineering / Chemical Engineering",
          "MSc in Energy Management",
          "MBA in Oil & Gas Management"
        ],
        industries: ["Oil & Gas", "Mining", "Power", "Energy Consulting", "Renewables"],
      ),
      "The Sustainability Architect": MastersDegreeCareerSuggestion(
        personalityType: "The Sustainability Architect",
        analysisDescription:
            "Thinking: Creative + Strategic\nWork: Field + Research\nMotivation: Impact + Recognition\nStrengths: Problem Solving + Communication\nInterest: Environment, Climate, ESG",
        psychologicalDescription:
            "A visionary who wants to combine problem-solving with global responsibility. They thrive on green innovation and future-proofing businesses.",
        bestPrograms: [
          "MSc in Sustainable Development / Climate Science",
          "M.Tech in Environmental Engineering / Energy Systems",
          "MBA in Sustainability Management",
          "MA in Public Policy (Environment Focus)"
        ],
        industries: [
          "Renewable Energy",
          "ESG Consulting",
          "Sustainability Policy",
          "Green Finance",
          "UN/NGOs"
        ],
      ),
      "The Social Impact Innovator": MastersDegreeCareerSuggestion(
        personalityType: "The Social Impact Innovator",
        analysisDescription:
            "Thinking: Empathetic + Creative\nWork: People + Field\nMotivation: Impact + Recognition\nStrengths: Leadership + Communication\nInterest: Development, Education, NGOs",
        psychologicalDescription:
            "Socially conscious, they want to solve problems like inequality, education, and mental health using creative strategies.",
        bestPrograms: [
          "MSW (Master of Social Work)",
          "MA in Development Studies / Education",
          "MBA in Nonprofit Management / CSR"
        ],
        industries: ["NGOs", "UN", "Social Enterprises", "CSR wings of corporates"],
      ),
    };

    return mastersMap[type] ??
        MastersDegreeCareerSuggestion(
          personalityType: "The Global Business Leader",
          analysisDescription:
              "Thinking: Strategic + Practical\nWork: Management + People\nMotivation: Money + Recognition\nStrengths: Leadership + Communication\nInterest: Business, Trade, Management",
          psychologicalDescription:
              "Naturally driven to lead, enjoys big-picture planning and influencing teams. They are motivated by recognition and financial success.",
          bestPrograms: [
            "MBA in Finance / Marketing / International Business",
            "MSc in Economics & Global Trade",
            "MA in International Relations (with Economics)"
          ],
          industries: [
            "Investment Banking",
            "Consulting",
            "Corporate Strategy",
            "Multinationals",
            "Startups"
          ],
        );
  }
}
