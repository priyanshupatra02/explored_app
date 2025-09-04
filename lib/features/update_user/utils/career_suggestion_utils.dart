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

class CareerSuggestionUtils {
  static CareerSuggestion? getCareerSuggestion(Map<String, String> answers) {
    
    final questionAnswers = _mapAnswersToOptions(answers);
    
    // Check against each personality pattern
    for (final pattern in _personalityPatterns) {
      if (_matchesPattern(questionAnswers, pattern['options'])) {
        return CareerSuggestion(
          personalityType: pattern['type'],
          description: pattern['description'],
          strengths: List<String>.from(pattern['strengths']),
          weaknesses: List<String>.from(pattern['weaknesses']),
          careerSuggestions: List<String>.from(pattern['careers']),
        );
      }
    }
    
    // Return default suggestion if no exact match
    return CareerSuggestion(
      personalityType: "The Balanced Pragmatist",
      description: "You combine logical reasoning with empathy and teamwork. You can adapt between analytical and social settings but may struggle to specialize deeply.",
      strengths: ["Adaptability", "Balanced skills", "Collaborative problem-solving"],
      weaknesses: ["Risk of being 'jack of all trades'"],
      careerSuggestions: ["Business Analyst", "Management Consultant", "Operations Manager", "Corporate Strategist", "Market Researcher"],
    );
  }

  static Map<int, String> _mapAnswersToOptions(Map<String, String> answers) {
    Map<int, String> mapped = {};
    
    // Map each answer to option (a, b, c, d) based on position in form
    final answersList = [
      answers['activityEnjoy'], // Q1
      answers['whatKindOfChallengesExciteYou'], // Q2
      answers['doYouPreferWorkingWith'], // Q3
      answers['whatDoYouEnjoyDoingInYourFreeTime'], // Q4
      answers['whatComesNaturallyToYou'], // Q5
      answers['whichSubjectWouldYouEnjoyTheMost'], // Q6
      answers['whatKindOfWorkEnvironmentSuitsYou'], // Q7
      answers['howDoYouApproachProblems'], // Q8
      answers['whichSkillAreYouBestAt'], // Q9
      answers['whatMotivatesYouMostInACareer'], // Q10
      answers['doYouPreferWorking'], // Q11
      answers['doYouLikeJobsThatInvolve'], // Q12
      answers['wouldYouRather'], // Q13
      answers['howDoYouFeelAboutDeadlines'], // Q14
      answers['whatKindOfJobStructureDoYouPrefer'], // Q15
      answers['wouldYouEnjoyACareerWhereYou'], // Q16
      answers['wouldYouLikeToTravelForWork'], // Q17
      answers['whatWouldMakeYouHappiestInAJob'], // Q18
      answers['doYouEnjoyWorkingWithTechnology'], // Q19
      answers['areYouInterestedInHealthcareOrMedicine'], // Q20
      answers['wouldYouLikeToWorkInEducationOrTeaching'], // Q21
      answers['doYouEnjoyResearchAndAnalysis'], // Q22
      answers['areYouInterestedInPsychologyOrCounseling'], // Q23
      answers['wouldYouLikeACareerInMediaOrFilmOrEntertainment'], // Q24
      answers['whatIsMoreImportantToYouInAJob'], // Q25
      answers['wouldYouRatherDo'], // Q26
      answers['whatKindOfEmployerDoYouPrefer'], // Q27
      answers['whereWouldYouRatherWork'], // Q28
      answers['areYouMoreOfA'], // Q29
      answers['doYouPrefer'], // Q30
    ];

    // Convert answers to options (a, b, c, d)
    for (int i = 0; i < answersList.length; i++) {
      final answer = answersList[i];
      if (answer != null) {
        mapped[i + 1] = _getOptionForAnswer(i + 1, answer);
      }
    }

    return mapped;
  }

  static String _getOptionForAnswer(int questionNumber, String answer) {
    switch (questionNumber) {
      case 1: // activityEnjoy
        switch (answer) {
          case 'Solving puzzles': return 'a';
          case 'Writing stories': return 'b';
          case 'Building things': return 'c';
          case 'Helping people': return 'd';
        }
        break;
      case 2: // whatKindOfChallengesExciteYou
        switch (answer) {
          case 'Logical problems': return 'a';
          case 'Expressing creativity': return 'b';
          case 'Fixing broken things': return 'c';
          case 'Supporting others': return 'd';
        }
        break;
      case 3: // doYouPreferWorkingWith
        switch (answer) {
          case 'Numbers': return 'a';
          case 'Words': return 'b';
          case 'Tools & Materials': return 'c';
          case 'People': return 'd';
        }
        break;
      case 4: // whatDoYouEnjoyDoingInYourFreeTime
        switch (answer) {
          case 'Playing strategy games': return 'a';
          case 'Reading or writing': return 'b';
          case 'DIY projects': return 'c';
          case 'Guiding others': return 'd';
        }
        break;
      case 5: // whatComesNaturallyToYou
        switch (answer) {
          case 'Finding patterns': return 'a';
          case 'Storytelling': return 'b';
          case 'Designing or fixing': return 'c';
          case 'Motivating others': return 'd';
        }
        break;
      case 6: // whichSubjectWouldYouEnjoyTheMost
        switch (answer) {
          case 'Mathematics': return 'a';
          case 'Languages': return 'b';
          case 'Sciences': return 'c';
          case 'Social Sciences': return 'd';
        }
        break;
      case 7: // whatKindOfWorkEnvironmentSuitsYou
        switch (answer) {
          case 'A quiet office': return 'a';
          case 'A creative space': return 'b';
          case 'A lab or workshop': return 'c';
          case 'A community/outdoor setting': return 'd';
        }
        break;
      case 8: // howDoYouApproachProblems
        switch (answer) {
          case 'With logic and calculations': return 'a';
          case 'Thinking outside the box': return 'b';
          case 'Hands-on solutions': return 'c';
          case 'Empathy and understanding': return 'd';
        }
        break;
      case 9: // whichSkillAreYouBestAt
        switch (answer) {
          case 'Analysing and calculating': return 'a';
          case 'Writing or designing': return 'b';
          case 'Building or fixing': return 'c';
          case 'Communicationg and leading': return 'd';
        }
        break;
      case 10: // whatMotivatesYouMostInACareer
        switch (answer) {
          case 'Critical thinking': return 'a';
          case 'Creative expression': return 'b';
          case 'Practical skills': return 'c';
          case 'Making a difference': return 'd';
        }
        break;
      case 11: // doYouPreferWorking
        switch (answer) {
          case 'Alone': return 'a';
          case 'In a team to brainstorm': return 'b';
          case 'Alone or in a team based on task': return 'c';
          case 'In a team where you can lead': return 'd';
        }
        break;
      case 12: // doYouLikeJobsThatInvolve
        switch (answer) {
          case 'Problem-solving': return 'a';
          case 'Creativity': return 'b';
          case 'Hands-on tasks': return 'c';
          case 'Managing/helping people': return 'd';
        }
        break;
      case 13: // wouldYouRather
        switch (answer) {
          case 'Analyze data': return 'a';
          case 'Write or design': return 'b';
          case 'Invent or fix things': return 'c';
          case 'Understand and help people': return 'd';
        }
        break;
      case 14: // howDoYouFeelAboutDeadlines
        switch (answer) {
          case 'I thrive under them': return 'a';
          case 'I prefer flexibility': return 'b';
          case 'I like structured timelines': return 'c';
          case 'I focus more on people than time': return 'd';
        }
        break;
      case 15: // whatKindOfJobStructureDoYouPrefer
        switch (answer) {
          case 'Well-defined': return 'a';
          case 'Creative and flexible': return 'b';
          case 'Technical and active': return 'c';
          case 'People-centered with variety': return 'd';
        }
        break;
      case 16: // wouldYouEnjoyACareerWhereYou
        switch (answer) {
          case 'Solve problems': return 'a';
          case 'Create something new': return 'b';
          case 'Work with machines': return 'c';
          case 'Support and guide others': return 'd';
        }
        break;
      case 17: // wouldYouLikeToTravelForWork
        switch (answer) {
          case 'No': return 'a';
          case 'Yes, for cultural/artistic reasons': return 'b';
          case 'Yes, for technical projects': return 'c';
          case 'Yes, to serve communities': return 'd';
        }
        break;
      case 18: // whatWouldMakeYouHappiestInAJob
        switch (answer) {
          case 'Intellectual challenges': return 'a';
          case 'Creative freedom': return 'b';
          case 'Technical tasks': return 'c';
        }
        break;
      case 19: // doYouEnjoyWorkingWithTechnology
        return answer == 'Yes' ? 'c' : 'a';
      case 20: // areYouInterestedInHealthcareOrMedicine
        return answer == 'Yes' ? 'a' : 'b';
      case 21: // wouldYouLikeToWorkInEducationOrTeaching
        return answer == 'Yes' ? 'd' : 'b';
      case 22: // doYouEnjoyResearchAndAnalysis
        return answer == 'Yes' ? 'a' : 'b';
      case 23: // areYouInterestedInPsychologyOrCounseling
        return answer == 'Yes' ? 'd' : 'b';
      case 24: // wouldYouLikeACareerInMediaOrFilmOrEntertainment
        return answer == 'Yes' ? 'b' : 'a';
      case 25: // whatIsMoreImportantToYouInAJob
        switch (answer) {
          case 'High salary': return 'a';
          case 'Satisfaction': return 'b';
          case 'Security': return 'c';
          case 'Growth': return 'd';
        }
        break;
      case 26: // wouldYouRatherDo
        switch (answer) {
          case 'Solve logical problems': return 'a';
          case 'Create/write': return 'b';
          case 'Build/repair': return 'c';
          case 'Counsel/support others': return 'd';
        }
        break;
      case 27: // whatKindOfEmployerDoYouPrefer
        return answer == 'Big company' ? 'a' : 'b';
      case 28: // whereWouldYouRatherWork
        return answer == 'Indoors' ? 'a' : 'b';
      case 29: // areYouMoreOfA
        return answer == 'Leader' ? 'd' : 'c';
      case 30: // doYouPrefer
        return answer == 'Precision and routine' ? 'a' : 'b';
    }
    return 'a'; // Default fallback
  }

  static bool _matchesPattern(Map<int, String> answers, List<String> pattern) {
    int matches = 0;
    for (String option in pattern) {
      final parts = option.split('(');
      if (parts.length == 2) {
        final questionNum = int.tryParse(parts[0]);
        final expectedOptions = parts[1].replaceAll(')', '').split('/');
        
        if (questionNum != null && answers.containsKey(questionNum)) {
          if (expectedOptions.contains(answers[questionNum])) {
            matches++;
          }
        }
      }
    }
    
    // Match if at least 70% of the pattern matches
    return matches >= (pattern.length * 0.7).ceil();
  }

  static final List<Map<String, dynamic>> _personalityPatterns = [
    {
      'type': 'The Analytical Creator',
      'options': ['1(a)', '2(a)', '5(a)', '7(b)', '9(b)', '17(a)', '17(b)'],
      'description': 'You balance logic with creativity. You enjoy solving puzzles but also like expressing yourself through design or writing. You thrive in problem-solving but may sometimes overthink and struggle with structure.',
      'strengths': ['Strong analytical reasoning', 'Creative thinking', 'Ability to generate innovative solutions'],
      'weaknesses': ['Can get lost in ideas without execution', 'Struggles with deadlines'],
      'careers': ['Data Analyst with storytelling focus', 'UX Designer', 'Market Researcher', 'Creative Strategist', 'Innovation Consultant']
    },
    {
      'type': 'The Human-Centered Thinker',
      'options': ['1(d)', '3(d)', '5(d)', '10(d)', '16(d)', '17(d)'],
      'description': 'You enjoy helping others and excel in understanding people. Communication is natural for you, and you like to motivate. However, you may avoid highly technical or isolated tasks.',
      'strengths': ['Empathy', 'Leadership', 'Communication', 'Ability to connect with people'],
      'weaknesses': ['Can be overly people-pleasing', 'Less comfortable with technical detail'],
      'careers': ['Psychologist / Counselor', 'HR Manager', 'Teacher / Educator', 'Community Development Officer', 'Public Relations Manager']
    },
    {
      'type': 'The Builder-Scientist',
      'options': ['1(c)', '2(c)', '5(c)', '7(c)', '15(c)', '19(c)'],
      'description': 'You like to fix, build, and create tangible outcomes. You prefer structured, technical environments and may dislike vague or overly flexible roles.',
      'strengths': ['Hands-on skills', 'Logical problem-solving', 'Structured thinking'],
      'weaknesses': ['May struggle with abstract concepts or highly people-focused roles'],
      'careers': ['Engineer (Mechanical, Civil, Robotics)', 'Lab Technician', 'Architect', 'Product Designer', 'Technical Specialist']
    },
    {
      'type': 'The Knowledge Explorer',
      'options': ['1(a)', '4(a)', '6(a)', '7(a)', '20(a)', '25(a)'],
      'description': 'You are curious and driven by intellectual challenges. You prefer research, analysis, and learning. Social roles may feel draining, but you thrive in problem-solving contexts.',
      'strengths': ['Research-oriented', 'Analytical', 'Detail-focused'],
      'weaknesses': ['May struggle with leadership or creativity-heavy roles'],
      'careers': ['Economist', 'Statistician', 'Academic Researcher', 'Business Intelligence Analyst', 'Policy Advisor']
    },
    {
      'type': 'The Visionary Storyteller',
      'options': ['1(b)', '2(b)', '4(b)', '5(b)', '7(b)', '10(b)', '15(b)'],
      'description': 'You love storytelling, design, and communication. You thrive in expressive roles and dislike overly rigid structures. Sometimes, you may struggle with deadlines.',
      'strengths': ['Creativity', 'Imagination', 'Communication'],
      'weaknesses': ['Lack of structure', 'Struggles with repetitive work'],
      'careers': ['Writer / Journalist', 'Graphic Designer', 'Content Creator', 'Advertising / Marketing Specialist', 'Film & Media Professional']
    },
    {
      'type': 'The Social Leader',
      'options': ['3(d)', '11(d)', '13(d)', '15(d)', '20(d)', '29(a)'],
      'description': 'You enjoy guiding others, leading teams, and making an impact. You are extroverted and thrive in people-centered environments.',
      'strengths': ['Leadership', 'Communication', 'Motivation'],
      'weaknesses': ['Can become impatient with detailed or technical tasks'],
      'careers': ['Corporate Manager', 'Politician', 'NGO Leader', 'Event Manager', 'Corporate Trainer']
    },
    {
      'type': 'The Creative Engineer',
      'options': ['2(b)', '3(c)', '7(c)', '9(c)', '17(c)', '19(c)'],
      'description': 'You enjoy both designing and building. You combine creativity with technical knowledge, making you strong in innovation. Sometimes, you may get stuck in experimentation without finishing.',
      'strengths': ['Innovation', 'Technical knowledge', 'Creative problem-solving'],
      'weaknesses': ['May lack patience for detailed analysis', 'Struggles with monotony'],
      'careers': ['Product Engineer', 'Industrial Designer', 'Game Developer', 'Robotics Engineer', 'R&D Specialist']
    },
    {
      'type': 'The Caring Educator',
      'options': ['1(d)', '4(d)', '6(d)', '16(d)', '21(d)', '23(d)'],
      'description': 'You enjoy guiding, teaching, and helping others improve. You prefer community-based roles with a strong human touch.',
      'strengths': ['Empathy', 'Teaching', 'Ability to simplify complex ideas'],
      'weaknesses': ['May lack technical focus', 'Can be emotionally drained'],
      'careers': ['Teacher / Professor', 'Career Counselor', 'Social Worker', 'Training & Development Specialist', 'Child Psychologist']
    }
  ];
}