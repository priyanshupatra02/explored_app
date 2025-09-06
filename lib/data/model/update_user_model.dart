import 'dart:convert';

class UpdateUserModel {
  final UpdateUserData? updateUserData;

  UpdateUserModel({
    this.updateUserData,
  });

  UpdateUserModel copyWith({
    UpdateUserData? data,
  }) =>
      UpdateUserModel(
        updateUserData: data ?? updateUserData,
      );

  factory UpdateUserModel.fromJson(String str) => UpdateUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserModel.fromMap(Map<String, dynamic> json) => UpdateUserModel(
        updateUserData: json["data"] == null ? null : UpdateUserData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": updateUserData?.toMap(),
      };
}

class UpdateUserData {
  final int? id;
  final String? documentId;
  final String? username;
  final String? email;
  final String? provider;
  final bool? confirmed;
  final bool? blocked;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final dynamic resetCode;
  final dynamic expiryTime;
  final bool? isAdmin;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic locale;
  final Feedback? feedback;
  final dynamic isPaid;
  final String? whatCourseDoYouNeed;
  final String? wouldDoYouDo;
  final String? careerChoice;
  final bool? wouldYouLikeToBeACareerCounsellor;

  UpdateUserData({
    this.id,
    this.documentId,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.phone,
    this.firstName,
    this.lastName,
    this.resetCode,
    this.expiryTime,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
    this.feedback,
    this.isPaid,
    this.whatCourseDoYouNeed,
    this.wouldDoYouDo,
    this.careerChoice,
    this.wouldYouLikeToBeACareerCounsellor,
  });

  UpdateUserData copyWith({
    int? id,
    String? documentId,
    String? username,
    String? email,
    String? provider,
    bool? confirmed,
    bool? blocked,
    String? phone,
    String? firstName,
    String? lastName,
    dynamic resetCode,
    dynamic expiryTime,
    bool? isAdmin,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    dynamic locale,
    Feedback? feedback,
    dynamic isPaid,
    String? whatCourseDoYouNeed,
    String? wouldDoYouDo,
    String? careerChoice,
    bool? wouldYouLikeToBeACareerCounsellor,
  }) =>
      UpdateUserData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        username: username ?? this.username,
        email: email ?? this.email,
        provider: provider ?? this.provider,
        confirmed: confirmed ?? this.confirmed,
        blocked: blocked ?? this.blocked,
        phone: phone ?? this.phone,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        resetCode: resetCode ?? this.resetCode,
        expiryTime: expiryTime ?? this.expiryTime,
        isAdmin: isAdmin ?? this.isAdmin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        locale: locale ?? this.locale,
        feedback: feedback ?? this.feedback,
        isPaid: isPaid ?? this.isPaid,
        whatCourseDoYouNeed: whatCourseDoYouNeed ?? this.whatCourseDoYouNeed,
        wouldDoYouDo: wouldDoYouDo ?? this.wouldDoYouDo,
        careerChoice:
            careerChoice ?? this.careerChoice,
        wouldYouLikeToBeACareerCounsellor:
            wouldYouLikeToBeACareerCounsellor ?? this.wouldYouLikeToBeACareerCounsellor,
      );

  factory UpdateUserData.fromJson(String str) => UpdateUserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserData.fromMap(Map<String, dynamic> json) => UpdateUserData(
        id: json["id"],
        documentId: json["documentId"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        phone: json["phone"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        resetCode: json["resetCode"],
        expiryTime: json["expiryTime"],
        isAdmin: json["isAdmin"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        feedback: json["feedback"] == null ? null : Feedback.fromMap(json["feedback"]),
        isPaid: json["isPaid"],
        whatCourseDoYouNeed: json["whatCourseDoYouNeed"],
        wouldDoYouDo: json["wouldDoYouDo"],
        careerChoice: json["careerChoice"]?.toString(),
        wouldYouLikeToBeACareerCounsellor: json["wouldYouLikeToBeACareerCounsellor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "resetCode": resetCode,
        "expiryTime": expiryTime,
        "isAdmin": isAdmin,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": locale,
        "feedback": feedback?.toMap(),
        "isPaid": isPaid,
        "whatCourseDoYouNeed": whatCourseDoYouNeed,
        "wouldDoYouDo": wouldDoYouDo,
        "careerChoice": careerChoice,
        "wouldYouLikeToBeACareerCounsellor": wouldYouLikeToBeACareerCounsellor,
      };
}

class Feedback {
  final String? doYouPrefer;
  final String? areYouMoreOfA;
  final String? wouldYouRather;
  final String? doYouPreferWorking;
  final String? whichSkillAreYouBestAt;
  final String? whatComesNaturallyToYou;
  final String? whereWouldYouRatherWork;
  final String? doYouLikeJobsThatInvolve;
  final String? howDoYouApproachProblems;
  final String? howDoYouFeelAboutDeadlines;
  final String? wouldYouLikeToTravelForWork;
  final String? wouldYouEnjoyACareerWhereYou;
  final String? doYouEnjoyResearchAndAnalysis;
  final String? whatKindOfChallengesExciteYou;
  final String? whatKindOfEmployerDoYouPrefer;
  final String? whatMotivatesYouMostInACareer;
  final String? whatIsMoreImportantToYouInAJob;
  final String? whatWouldMakeYouHappiestInAJob;
  final String? whichActivityDoYouEnjoyTheMost;
  final String? doYouEnjoyWorkingWithTechnology;
  final String? whichSubjectWouldYouEnjoyTheMost;
  final String? whatKindOfJobStructureDoYouPrefer;
  final String? whatKindOfWorkEnvironmentSuitsYou;
  final String? areYouInterestedInHealthcareOrMedicine;
  final String? wouldYouLikeToWorkInEducationOrTeaching;
  final String? areYouInterestedInPsychologyOrCounseling;
  final String? wouldYouLikeACareerInMediaFilmOrEntertainment;

  Feedback({
    this.doYouPrefer,
    this.areYouMoreOfA,
    this.wouldYouRather,
    this.doYouPreferWorking,
    this.whichSkillAreYouBestAt,
    this.whatComesNaturallyToYou,
    this.whereWouldYouRatherWork,
    this.doYouLikeJobsThatInvolve,
    this.howDoYouApproachProblems,
    this.howDoYouFeelAboutDeadlines,
    this.wouldYouLikeToTravelForWork,
    this.wouldYouEnjoyACareerWhereYou,
    this.doYouEnjoyResearchAndAnalysis,
    this.whatKindOfChallengesExciteYou,
    this.whatKindOfEmployerDoYouPrefer,
    this.whatMotivatesYouMostInACareer,
    this.whatIsMoreImportantToYouInAJob,
    this.whatWouldMakeYouHappiestInAJob,
    this.whichActivityDoYouEnjoyTheMost,
    this.doYouEnjoyWorkingWithTechnology,
    this.whichSubjectWouldYouEnjoyTheMost,
    this.whatKindOfJobStructureDoYouPrefer,
    this.whatKindOfWorkEnvironmentSuitsYou,
    this.areYouInterestedInHealthcareOrMedicine,
    this.wouldYouLikeToWorkInEducationOrTeaching,
    this.areYouInterestedInPsychologyOrCounseling,
    this.wouldYouLikeACareerInMediaFilmOrEntertainment,
  });

  Feedback copyWith({
    String? doYouPrefer,
    String? areYouMoreOfA,
    String? wouldYouRather,
    String? doYouPreferWorking,
    String? whichSkillAreYouBestAt,
    String? whatComesNaturallyToYou,
    String? whereWouldYouRatherWork,
    String? doYouLikeJobsThatInvolve,
    String? howDoYouApproachProblems,
    String? howDoYouFeelAboutDeadlines,
    String? wouldYouLikeToTravelForWork,
    String? wouldYouEnjoyACareerWhereYou,
    String? doYouEnjoyResearchAndAnalysis,
    String? whatKindOfChallengesExciteYou,
    String? whatKindOfEmployerDoYouPrefer,
    String? whatMotivatesYouMostInACareer,
    String? whatIsMoreImportantToYouInAJob,
    String? whatWouldMakeYouHappiestInAJob,
    String? whichActivityDoYouEnjoyTheMost,
    String? doYouEnjoyWorkingWithTechnology,
    String? whichSubjectWouldYouEnjoyTheMost,
    String? whatKindOfJobStructureDoYouPrefer,
    String? whatKindOfWorkEnvironmentSuitsYou,
    String? areYouInterestedInHealthcareOrMedicine,
    String? wouldYouLikeToWorkInEducationOrTeaching,
    String? areYouInterestedInPsychologyOrCounseling,
    String? wouldYouLikeACareerInMediaFilmOrEntertainment,
  }) =>
      Feedback(
        doYouPrefer: doYouPrefer ?? this.doYouPrefer,
        areYouMoreOfA: areYouMoreOfA ?? this.areYouMoreOfA,
        wouldYouRather: wouldYouRather ?? this.wouldYouRather,
        doYouPreferWorking: doYouPreferWorking ?? this.doYouPreferWorking,
        whichSkillAreYouBestAt: whichSkillAreYouBestAt ?? this.whichSkillAreYouBestAt,
        whatComesNaturallyToYou: whatComesNaturallyToYou ?? this.whatComesNaturallyToYou,
        whereWouldYouRatherWork: whereWouldYouRatherWork ?? this.whereWouldYouRatherWork,
        doYouLikeJobsThatInvolve: doYouLikeJobsThatInvolve ?? this.doYouLikeJobsThatInvolve,
        howDoYouApproachProblems: howDoYouApproachProblems ?? this.howDoYouApproachProblems,
        howDoYouFeelAboutDeadlines: howDoYouFeelAboutDeadlines ?? this.howDoYouFeelAboutDeadlines,
        wouldYouLikeToTravelForWork:
            wouldYouLikeToTravelForWork ?? this.wouldYouLikeToTravelForWork,
        wouldYouEnjoyACareerWhereYou:
            wouldYouEnjoyACareerWhereYou ?? this.wouldYouEnjoyACareerWhereYou,
        doYouEnjoyResearchAndAnalysis:
            doYouEnjoyResearchAndAnalysis ?? this.doYouEnjoyResearchAndAnalysis,
        whatKindOfChallengesExciteYou:
            whatKindOfChallengesExciteYou ?? this.whatKindOfChallengesExciteYou,
        whatKindOfEmployerDoYouPrefer:
            whatKindOfEmployerDoYouPrefer ?? this.whatKindOfEmployerDoYouPrefer,
        whatMotivatesYouMostInACareer:
            whatMotivatesYouMostInACareer ?? this.whatMotivatesYouMostInACareer,
        whatIsMoreImportantToYouInAJob:
            whatIsMoreImportantToYouInAJob ?? this.whatIsMoreImportantToYouInAJob,
        whatWouldMakeYouHappiestInAJob:
            whatWouldMakeYouHappiestInAJob ?? this.whatWouldMakeYouHappiestInAJob,
        whichActivityDoYouEnjoyTheMost:
            whichActivityDoYouEnjoyTheMost ?? this.whichActivityDoYouEnjoyTheMost,
        doYouEnjoyWorkingWithTechnology:
            doYouEnjoyWorkingWithTechnology ?? this.doYouEnjoyWorkingWithTechnology,
        whichSubjectWouldYouEnjoyTheMost:
            whichSubjectWouldYouEnjoyTheMost ?? this.whichSubjectWouldYouEnjoyTheMost,
        whatKindOfJobStructureDoYouPrefer:
            whatKindOfJobStructureDoYouPrefer ?? this.whatKindOfJobStructureDoYouPrefer,
        whatKindOfWorkEnvironmentSuitsYou:
            whatKindOfWorkEnvironmentSuitsYou ?? this.whatKindOfWorkEnvironmentSuitsYou,
        areYouInterestedInHealthcareOrMedicine:
            areYouInterestedInHealthcareOrMedicine ?? this.areYouInterestedInHealthcareOrMedicine,
        wouldYouLikeToWorkInEducationOrTeaching:
            wouldYouLikeToWorkInEducationOrTeaching ?? this.wouldYouLikeToWorkInEducationOrTeaching,
        areYouInterestedInPsychologyOrCounseling: areYouInterestedInPsychologyOrCounseling ??
            this.areYouInterestedInPsychologyOrCounseling,
        wouldYouLikeACareerInMediaFilmOrEntertainment:
            wouldYouLikeACareerInMediaFilmOrEntertainment ??
                this.wouldYouLikeACareerInMediaFilmOrEntertainment,
      );

  factory Feedback.fromJson(String str) => Feedback.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feedback.fromMap(Map<String, dynamic> json) => Feedback(
        doYouPrefer: json["doYouPrefer"],
        areYouMoreOfA: json["areYouMoreOfA"],
        wouldYouRather: json["wouldYouRather"],
        doYouPreferWorking: json["doYouPreferWorking"],
        whichSkillAreYouBestAt: json["whichSkillAreYouBestAt"],
        whatComesNaturallyToYou: json["whatComesNaturallyToYou"],
        whereWouldYouRatherWork: json["whereWouldYouRatherWork"],
        doYouLikeJobsThatInvolve: json["doYouLikeJobsThatInvolve"],
        howDoYouApproachProblems: json["howDoYouApproachProblems"],
        howDoYouFeelAboutDeadlines: json["howDoYouFeelAboutDeadlines"],
        wouldYouLikeToTravelForWork: json["wouldYouLikeToTravelForWork"],
        wouldYouEnjoyACareerWhereYou: json["wouldYouEnjoyACareerWhereYou"],
        doYouEnjoyResearchAndAnalysis: json["doYouEnjoyResearchAndAnalysis"],
        whatKindOfChallengesExciteYou: json["whatKindOfChallengesExciteYou"],
        whatKindOfEmployerDoYouPrefer: json["whatKindOfEmployerDoYouPrefer"],
        whatMotivatesYouMostInACareer: json["whatMotivatesYouMostInACareer"],
        whatIsMoreImportantToYouInAJob: json["whatIsMoreImportantToYouInAJob"],
        whatWouldMakeYouHappiestInAJob: json["whatWouldMakeYouHappiestInAJob"],
        whichActivityDoYouEnjoyTheMost: json["whichActivityDoYouEnjoyTheMost"],
        doYouEnjoyWorkingWithTechnology: json["doYouEnjoyWorkingWithTechnology"],
        whichSubjectWouldYouEnjoyTheMost: json["whichSubjectWouldYouEnjoyTheMost"],
        whatKindOfJobStructureDoYouPrefer: json["whatKindOfJobStructureDoYouPrefer"],
        whatKindOfWorkEnvironmentSuitsYou: json["whatKindOfWorkEnvironmentSuitsYou"],
        areYouInterestedInHealthcareOrMedicine: json["areYouInterestedInHealthcareOrMedicine"],
        wouldYouLikeToWorkInEducationOrTeaching: json["wouldYouLikeToWorkInEducationOrTeaching"],
        areYouInterestedInPsychologyOrCounseling: json["areYouInterestedInPsychologyOrCounseling"],
        wouldYouLikeACareerInMediaFilmOrEntertainment:
            json["wouldYouLikeACareerInMediaFilmOrEntertainment"],
      );

  Map<String, dynamic> toMap() => {
        "doYouPrefer": doYouPrefer,
        "areYouMoreOfA": areYouMoreOfA,
        "wouldYouRather": wouldYouRather,
        "doYouPreferWorking": doYouPreferWorking,
        "whichSkillAreYouBestAt": whichSkillAreYouBestAt,
        "whatComesNaturallyToYou": whatComesNaturallyToYou,
        "whereWouldYouRatherWork": whereWouldYouRatherWork,
        "doYouLikeJobsThatInvolve": doYouLikeJobsThatInvolve,
        "howDoYouApproachProblems": howDoYouApproachProblems,
        "howDoYouFeelAboutDeadlines": howDoYouFeelAboutDeadlines,
        "wouldYouLikeToTravelForWork": wouldYouLikeToTravelForWork,
        "wouldYouEnjoyACareerWhereYou": wouldYouEnjoyACareerWhereYou,
        "doYouEnjoyResearchAndAnalysis": doYouEnjoyResearchAndAnalysis,
        "whatKindOfChallengesExciteYou": whatKindOfChallengesExciteYou,
        "whatKindOfEmployerDoYouPrefer": whatKindOfEmployerDoYouPrefer,
        "whatMotivatesYouMostInACareer": whatMotivatesYouMostInACareer,
        "whatIsMoreImportantToYouInAJob": whatIsMoreImportantToYouInAJob,
        "whatWouldMakeYouHappiestInAJob": whatWouldMakeYouHappiestInAJob,
        "whichActivityDoYouEnjoyTheMost": whichActivityDoYouEnjoyTheMost,
        "doYouEnjoyWorkingWithTechnology": doYouEnjoyWorkingWithTechnology,
        "whichSubjectWouldYouEnjoyTheMost": whichSubjectWouldYouEnjoyTheMost,
        "whatKindOfJobStructureDoYouPrefer": whatKindOfJobStructureDoYouPrefer,
        "whatKindOfWorkEnvironmentSuitsYou": whatKindOfWorkEnvironmentSuitsYou,
        "areYouInterestedInHealthcareOrMedicine": areYouInterestedInHealthcareOrMedicine,
        "wouldYouLikeToWorkInEducationOrTeaching": wouldYouLikeToWorkInEducationOrTeaching,
        "areYouInterestedInPsychologyOrCounseling": areYouInterestedInPsychologyOrCounseling,
        "wouldYouLikeACareerInMediaFilmOrEntertainment":
            wouldYouLikeACareerInMediaFilmOrEntertainment,
      };
}
