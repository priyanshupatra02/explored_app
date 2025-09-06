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

  static MastersDegreeCareerSuggestion? getMastersDegreeCareerSuggestion(Map<String, String> answers) {
    
    final questionAnswers = _mapAnswersToOptions(answers);
    
    // Check against each master's degree personality pattern
    for (final pattern in _mastersPersonalityPatterns) {
      if (_matchesPattern(questionAnswers, pattern['options'])) {
        return MastersDegreeCareerSuggestion(
          personalityType: pattern['type'],
          analysisDescription: pattern['analysisDescription'],
          psychologicalDescription: pattern['psychologicalDescription'],
          bestPrograms: List<String>.from(pattern['bestPrograms']),
          industries: List<String>.from(pattern['industries']),
        );
      }
    }
    
    // Return default suggestion if no exact match
    return MastersDegreeCareerSuggestion(
      personalityType: "The Global Business Leader",
      analysisDescription: "Thinking: Strategic + Practical\nWork: Management + People\nMotivation: Money + Recognition\nStrengths: Leadership + Communication\nInterest: Business, Trade, Management",
      psychologicalDescription: "Naturally driven to lead, enjoys big-picture planning and influencing teams. They are motivated by recognition and financial success.",
      bestPrograms: ["MBA in Finance / Marketing / International Business", "MSc in Economics & Global Trade", "MA in International Relations (with Economics)"],
      industries: ["Investment Banking", "Consulting", "Corporate Strategy", "Multinationals", "Startups"],
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

  static final List<Map<String, dynamic>> _mastersPersonalityPatterns = [
    {
      'type': 'The Data-Driven Innovator',
      'options': ['1(a)', '2(a)', '6(a)', '7(a)', '8(a)', '9(a)', '12(a)', '19(c)', '22(a)'],
      'analysisDescription': 'Thinking: Analytical + Strategic\nWork Preference: Research + Technology\nMotivation: Innovation + Impact\nStrengths: Data Handling + Problem Solving\nInterest: IT, AI, Analytics',
      'psychologicalDescription': 'This personality thrives on structured analysis, large datasets, and using technology to drive innovation. They balance logic with creativity to find new solutions.',
      'bestPrograms': ['MSc in Data Science / Business Analytics', 'M.Tech in Artificial Intelligence / Machine Learning', 'MBA in Business Analytics / Information Systems'],
      'industries': ['IT services', 'Consulting', 'FinTech', 'AI Startups', 'Manufacturing (automation)']
    },
    {
      'type': 'The Tech-Engineer Builder',
      'options': ['1(c)', '2(c)', '6(c)', '7(c)', '8(c)', '15(c)', '19(c)'],
      'analysisDescription': 'Thinking: Practical + Analytical\nWork: Lab + Technology\nMotivation: Stability + Innovation\nStrengths: Design + Problem Solving\nInterest: Engineering, Petroleum, Infrastructure',
      'psychologicalDescription': 'Hands-on, loves designing systems and building solutions. They excel in engineering challenges and prefer tangible results.',
      'bestPrograms': ['M.Tech in Mechanical, Civil, Electrical, Petroleum, Chemical Engineering', 'MSc in Energy Engineering / Robotics', 'MBA in Operations / Supply Chain'],
      'industries': ['Oil & Gas', 'Renewable Energy', 'Aerospace', 'Robotics', 'Infrastructure', 'Automobiles']
    },
    {
      'type': 'The Sustainability Architect',
      'options': ['2(b)', '7(b)', '10(d)', '16(d)', '17(c)', '25(d)'],
      'analysisDescription': 'Thinking: Creative + Strategic\nWork: Field + Research\nMotivation: Impact + Recognition\nStrengths: Problem Solving + Communication\nInterest: Environment, Climate, ESG',
      'psychologicalDescription': 'A visionary who wants to combine problem-solving with global responsibility. They thrive on green innovation and future-proofing businesses.',
      'bestPrograms': ['MSc in Sustainable Development / Climate Science', 'M.Tech in Environmental Engineering / Energy Systems', 'MBA in Sustainability Management', 'MA in Public Policy (Environment Focus)'],
      'industries': ['Renewable Energy', 'ESG Consulting', 'Sustainability Policy', 'Green Finance', 'UN/NGOs']
    },
    {
      'type': 'The Healthcare Strategist',
      'options': ['1(d)', '8(d)', '20(a)', '23(d)', '25(c)'],
      'analysisDescription': 'Thinking: Empathetic + Analytical\nWork: People + Research\nMotivation: Impact + Stability\nStrengths: Communication + Data Handling\nInterest: Healthcare, Psychology, Public Health',
      'psychologicalDescription': 'Balances empathy with research-driven decisions. Interested in improving health systems, patient care, or mental well-being.',
      'bestPrograms': ['Master of Public Health (MPH)', 'MSc in Health Informatics / Biotechnology', 'MA in Psychology / Counseling', 'MBA in Healthcare Management', 'MBBS → MD/MS (for clinical paths)'],
      'industries': ['Hospitals', 'Pharma', 'Health-Tech', 'Mental Health Counseling', 'Bioinformatics']
    },
    {
      'type': 'The Global Business Leader',
      'options': ['11(d)', '25(a)', '27(a)', '29(a)'],
      'analysisDescription': 'Thinking: Strategic + Practical\nWork: Management + People\nMotivation: Money + Recognition\nStrengths: Leadership + Communication\nInterest: Business, Trade, Management',
      'psychologicalDescription': 'Naturally driven to lead, enjoys big-picture planning and influencing teams. They are motivated by recognition and financial success.',
      'bestPrograms': ['MBA in Finance / Marketing / International Business', 'MSc in Economics & Global Trade', 'MA in International Relations (with Economics)'],
      'industries': ['Investment Banking', 'Consulting', 'Corporate Strategy', 'Multinationals', 'Startups']
    },
    {
      'type': 'The Creative Tech Designer',
      'options': ['1(b)', '2(b)', '7(b)', '9(b)', '10(b)', '19(c)', '24(b)'],
      'analysisDescription': 'Thinking: Creative + Analytical\nWork: Design + Technology\nMotivation: Innovation + Recognition\nStrengths: Design + Problem Solving\nInterest: IT, Media, Arts, Gaming',
      'psychologicalDescription': 'Loves blending technology and creativity. They thrive in digital product design, UX/UI, gaming, and immersive technologies.',
      'bestPrograms': ['MSc in Human-Computer Interaction', 'M.Des in Product / Graphic / Game Design', 'MA in Digital Media / Animation'],
      'industries': ['Gaming', 'EdTech', 'Creative AI', 'UI/UX', 'Film/Media', 'AR/VR']
    },
    {
      'type': 'The Policy & Law Analyst',
      'options': ['1(a)', '8(a)', '22(a)', '25(c)'],
      'analysisDescription': 'Thinking: Strategic + Analytical\nWork: People + Research\nMotivation: Impact + Stability\nStrengths: Communication + Data\nInterest: Policy, Law, Governance',
      'psychologicalDescription': 'A natural policy shaper. Skilled in analyzing laws and their effects on society, they blend logic with ethical reasoning.',
      'bestPrograms': ['MA in Public Policy / Political Science', 'LLM (for Law graduates)', 'MSc in Tech Policy / Governance', 'MBA in Public Administration'],
      'industries': ['Government', 'Think Tanks', 'Legal-Tech', 'UN/NGOs', 'Compliance']
    },
    {
      'type': 'The Finance Quant',
      'options': ['1(a)', '3(a)', '8(a)', '25(a)'],
      'analysisDescription': 'Thinking: Analytical + Strategic\nWork: Research + Management\nMotivation: Money + Innovation\nStrengths: Data + Problem Solving\nInterest: Finance, Economics, Markets',
      'psychologicalDescription': 'Loves numbers, thrives on risk models, and market predictions. Prefers structured, high-stakes problem-solving.',
      'bestPrograms': ['MSc in Finance / Quantitative Finance', 'M.Com in Banking & Insurance', 'MBA in Finance'],
      'industries': ['Hedge Funds', 'Investment Banking', 'FinTech', 'Consulting']
    },
    {
      'type': 'The Petroleum & Energy Specialist',
      'options': ['1(c)', '6(c)', '7(c)', '25(c)'],
      'analysisDescription': 'Thinking: Practical + Analytical\nWork: Lab + Field\nMotivation: Stability + Money\nStrengths: Problem Solving + Technical\nInterest: Petroleum, Mining, Energy',
      'psychologicalDescription': 'Likes working with tangible resources and complex engineering processes. Motivated by stability and global energy demand.',
      'bestPrograms': ['M.Tech in Petroleum Engineering / Chemical Engineering', 'MSc in Energy Management', 'MBA in Oil & Gas Management'],
      'industries': ['Oil & Gas', 'Mining', 'Power', 'Energy Consulting', 'Renewables']
    },
    {
      'type': 'The Social Impact Innovator',
      'options': ['1(d)', '2(d)', '10(d)', '16(d)', '21(d)', '23(d)'],
      'analysisDescription': 'Thinking: Empathetic + Creative\nWork: People + Field\nMotivation: Impact + Recognition\nStrengths: Leadership + Communication\nInterest: Development, Education, NGOs',
      'psychologicalDescription': 'Socially conscious, they want to solve problems like inequality, education, and mental health using creative strategies.',
      'bestPrograms': ['MSW (Master of Social Work)', 'MA in Development Studies / Education', 'MBA in Nonprofit Management / CSR'],
      'industries': ['NGOs', 'UN', 'Social Enterprises', 'CSR wings of corporates']
    }
  ];
}