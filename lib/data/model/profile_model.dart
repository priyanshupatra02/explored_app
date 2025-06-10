import 'dart:convert';

class ProfileModel {
    final int? id;
    final String? documentId;
    final String? username;
    final String? email;
    final bool? confirmed;
    final bool? blocked;
    final String? phone;
    final String? firstName;
    final String? lastName;
    final dynamic resetCode;
    final dynamic expiryTime;
    final bool? isAdmin;
    final Feedback? feedback;
    final bool? isPaid;
    final String? whatCourseDoYouNeed;
    final String? wouldDoYouDo;
    final bool? doYouNeedACareerCounselling;
    final bool? wouldYouLikeToBeACareerCounsellor;

    ProfileModel({
        this.id,
        this.documentId,
        this.username,
        this.email,
        this.confirmed,
        this.blocked,
        this.phone,
        this.firstName,
        this.lastName,
        this.resetCode,
        this.expiryTime,
        this.isAdmin,
        this.feedback,
        this.isPaid,
        this.whatCourseDoYouNeed,
        this.wouldDoYouDo,
        this.doYouNeedACareerCounselling,
        this.wouldYouLikeToBeACareerCounsellor,
    });

    ProfileModel copyWith({
        int? id,
        String? documentId,
        String? username,
        String? email,
        bool? confirmed,
        bool? blocked,
        String? phone,
        String? firstName,
        String? lastName,
        dynamic resetCode,
        dynamic expiryTime,
        bool? isAdmin,
        Feedback? feedback,
        bool? isPaid,
        String? whatCourseDoYouNeed,
        String? wouldDoYouDo,
        bool? doYouNeedACareerCounselling,
        bool? wouldYouLikeToBeACareerCounsellor,
    }) => 
        ProfileModel(
            id: id ?? this.id,
            documentId: documentId ?? this.documentId,
            username: username ?? this.username,
            email: email ?? this.email,
            confirmed: confirmed ?? this.confirmed,
            blocked: blocked ?? this.blocked,
            phone: phone ?? this.phone,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            resetCode: resetCode ?? this.resetCode,
            expiryTime: expiryTime ?? this.expiryTime,
            isAdmin: isAdmin ?? this.isAdmin,
            feedback: feedback ?? this.feedback,
            isPaid: isPaid ?? this.isPaid,
            whatCourseDoYouNeed: whatCourseDoYouNeed ?? this.whatCourseDoYouNeed,
            wouldDoYouDo: wouldDoYouDo ?? this.wouldDoYouDo,
            doYouNeedACareerCounselling: doYouNeedACareerCounselling ?? this.doYouNeedACareerCounselling,
            wouldYouLikeToBeACareerCounsellor: wouldYouLikeToBeACareerCounsellor ?? this.wouldYouLikeToBeACareerCounsellor,
        );

    factory ProfileModel.fromJson(String str) => ProfileModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        documentId: json["documentId"],
        username: json["username"],
        email: json["email"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        phone: json["phone"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        resetCode: json["resetCode"],
        expiryTime: json["expiryTime"],
        isAdmin: json["isAdmin"],
        feedback: json["feedback"] == null ? null : Feedback.fromMap(json["feedback"]),
        isPaid: json["isPaid"],
        whatCourseDoYouNeed: json["whatCourseDoYouNeed"],
        wouldDoYouDo: json["wouldDoYouDo"],
        doYouNeedACareerCounselling: json["doYouNeedACareerCounselling"],
        wouldYouLikeToBeACareerCounsellor: json["wouldYouLikeToBeACareerCounsellor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "username": username,
        "email": email,
        "confirmed": confirmed,
        "blocked": blocked,
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "resetCode": resetCode,
        "expiryTime": expiryTime,
        "isAdmin": isAdmin,
        "feedback": feedback?.toMap(),
        "isPaid": isPaid,
        "whatCourseDoYouNeed": whatCourseDoYouNeed,
        "wouldDoYouDo": wouldDoYouDo,
        "doYouNeedACareerCounselling": doYouNeedACareerCounselling,
        "wouldYouLikeToBeACareerCounsellor": wouldYouLikeToBeACareerCounsellor,
    };
}

class Feedback {
    final String? doYouPrefer;
    final String? areYouMoreOfA;
    final String? wouldYouRather;
    final String? wouldYouRatherDo;
    final String? doYouPreferWorking;
    final String? doYouPreferWorkingWith;
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
    final String? whatDoYouEnjoyDoingInYourFreeTime;
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
        this.wouldYouRatherDo,
        this.doYouPreferWorking,
        this.doYouPreferWorkingWith,
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
        this.whatDoYouEnjoyDoingInYourFreeTime,
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
        String? wouldYouRatherDo,
        String? doYouPreferWorking,
        String? doYouPreferWorkingWith,
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
        String? whatDoYouEnjoyDoingInYourFreeTime,
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
            wouldYouRatherDo: wouldYouRatherDo ?? this.wouldYouRatherDo,
            doYouPreferWorking: doYouPreferWorking ?? this.doYouPreferWorking,
            doYouPreferWorkingWith: doYouPreferWorkingWith ?? this.doYouPreferWorkingWith,
            whichSkillAreYouBestAt: whichSkillAreYouBestAt ?? this.whichSkillAreYouBestAt,
            whatComesNaturallyToYou: whatComesNaturallyToYou ?? this.whatComesNaturallyToYou,
            whereWouldYouRatherWork: whereWouldYouRatherWork ?? this.whereWouldYouRatherWork,
            doYouLikeJobsThatInvolve: doYouLikeJobsThatInvolve ?? this.doYouLikeJobsThatInvolve,
            howDoYouApproachProblems: howDoYouApproachProblems ?? this.howDoYouApproachProblems,
            howDoYouFeelAboutDeadlines: howDoYouFeelAboutDeadlines ?? this.howDoYouFeelAboutDeadlines,
            wouldYouLikeToTravelForWork: wouldYouLikeToTravelForWork ?? this.wouldYouLikeToTravelForWork,
            wouldYouEnjoyACareerWhereYou: wouldYouEnjoyACareerWhereYou ?? this.wouldYouEnjoyACareerWhereYou,
            doYouEnjoyResearchAndAnalysis: doYouEnjoyResearchAndAnalysis ?? this.doYouEnjoyResearchAndAnalysis,
            whatKindOfChallengesExciteYou: whatKindOfChallengesExciteYou ?? this.whatKindOfChallengesExciteYou,
            whatKindOfEmployerDoYouPrefer: whatKindOfEmployerDoYouPrefer ?? this.whatKindOfEmployerDoYouPrefer,
            whatMotivatesYouMostInACareer: whatMotivatesYouMostInACareer ?? this.whatMotivatesYouMostInACareer,
            whatIsMoreImportantToYouInAJob: whatIsMoreImportantToYouInAJob ?? this.whatIsMoreImportantToYouInAJob,
            whatWouldMakeYouHappiestInAJob: whatWouldMakeYouHappiestInAJob ?? this.whatWouldMakeYouHappiestInAJob,
            whichActivityDoYouEnjoyTheMost: whichActivityDoYouEnjoyTheMost ?? this.whichActivityDoYouEnjoyTheMost,
            doYouEnjoyWorkingWithTechnology: doYouEnjoyWorkingWithTechnology ?? this.doYouEnjoyWorkingWithTechnology,
            whichSubjectWouldYouEnjoyTheMost: whichSubjectWouldYouEnjoyTheMost ?? this.whichSubjectWouldYouEnjoyTheMost,
            whatDoYouEnjoyDoingInYourFreeTime: whatDoYouEnjoyDoingInYourFreeTime ?? this.whatDoYouEnjoyDoingInYourFreeTime,
            whatKindOfJobStructureDoYouPrefer: whatKindOfJobStructureDoYouPrefer ?? this.whatKindOfJobStructureDoYouPrefer,
            whatKindOfWorkEnvironmentSuitsYou: whatKindOfWorkEnvironmentSuitsYou ?? this.whatKindOfWorkEnvironmentSuitsYou,
            areYouInterestedInHealthcareOrMedicine: areYouInterestedInHealthcareOrMedicine ?? this.areYouInterestedInHealthcareOrMedicine,
            wouldYouLikeToWorkInEducationOrTeaching: wouldYouLikeToWorkInEducationOrTeaching ?? this.wouldYouLikeToWorkInEducationOrTeaching,
            areYouInterestedInPsychologyOrCounseling: areYouInterestedInPsychologyOrCounseling ?? this.areYouInterestedInPsychologyOrCounseling,
            wouldYouLikeACareerInMediaFilmOrEntertainment: wouldYouLikeACareerInMediaFilmOrEntertainment ?? this.wouldYouLikeACareerInMediaFilmOrEntertainment,
        );

    factory Feedback.fromJson(String str) => Feedback.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Feedback.fromMap(Map<String, dynamic> json) => Feedback(
        doYouPrefer: json["doYouPrefer"],
        areYouMoreOfA: json["areYouMoreOfA"],
        wouldYouRather: json["wouldYouRather"],
        wouldYouRatherDo: json["wouldYouRatherDo"],
        doYouPreferWorking: json["doYouPreferWorking"],
        doYouPreferWorkingWith: json["doYouPreferWorkingWith"],
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
        whatDoYouEnjoyDoingInYourFreeTime: json["whatDoYouEnjoyDoingInYourFreeTime"],
        whatKindOfJobStructureDoYouPrefer: json["whatKindOfJobStructureDoYouPrefer"],
        whatKindOfWorkEnvironmentSuitsYou: json["whatKindOfWorkEnvironmentSuitsYou"],
        areYouInterestedInHealthcareOrMedicine: json["areYouInterestedInHealthcareOrMedicine"],
        wouldYouLikeToWorkInEducationOrTeaching: json["wouldYouLikeToWorkInEducationOrTeaching"],
        areYouInterestedInPsychologyOrCounseling: json["areYouInterestedInPsychologyOrCounseling"],
        wouldYouLikeACareerInMediaFilmOrEntertainment: json["wouldYouLikeACareerInMediaFilmOrEntertainment"],
    );

    Map<String, dynamic> toMap() => {
        "doYouPrefer": doYouPrefer,
        "areYouMoreOfA": areYouMoreOfA,
        "wouldYouRather": wouldYouRather,
        "wouldYouRatherDo": wouldYouRatherDo,
        "doYouPreferWorking": doYouPreferWorking,
        "doYouPreferWorkingWith": doYouPreferWorkingWith,
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
        "whatDoYouEnjoyDoingInYourFreeTime": whatDoYouEnjoyDoingInYourFreeTime,
        "whatKindOfJobStructureDoYouPrefer": whatKindOfJobStructureDoYouPrefer,
        "whatKindOfWorkEnvironmentSuitsYou": whatKindOfWorkEnvironmentSuitsYou,
        "areYouInterestedInHealthcareOrMedicine": areYouInterestedInHealthcareOrMedicine,
        "wouldYouLikeToWorkInEducationOrTeaching": wouldYouLikeToWorkInEducationOrTeaching,
        "areYouInterestedInPsychologyOrCounseling": areYouInterestedInPsychologyOrCounseling,
        "wouldYouLikeACareerInMediaFilmOrEntertainment": wouldYouLikeACareerInMediaFilmOrEntertainment,
    };
}
