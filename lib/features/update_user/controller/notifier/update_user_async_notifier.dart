import 'dart:async';

import 'package:edtech_app/data/model/user_response_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service_pod.dart';
import 'package:edtech_app/features/update_user/controller/state/update_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUserAsyncNotifier extends AutoDisposeAsyncNotifier<UpdateUserState> {
  @override
  FutureOr<UpdateUserState> build() {
    return const InitialUpdateUserState();
  }

  Future<void> updateUser({
    required final String userId,
    required final String whatCourseDoYouNeed,
    required final String doYouNeedCareerCounselling,
    required final String whatDoYouDo,
    required final String wouldYouLikeToBeACareerCounsellor,
    required final String whichActivityDoYouEnjoyTheMost,
    required final String whatKindOfChallengesExciteYou,
    required final String doYouPreferWorkingWith,
    required final String whatDoYouEnjoyDoingInYourFreeTime,
    required final String whatComesNaturallyToYou,
    required final String whichSubjectWouldYouEnjoyTheMost,
    required final String whatKindOfWorkEnvironmentSuitsYou,
    required final String howDoYouApproachProblems,
    required final String whichSkillAreYouBestAt,
    required final String whatMotivatesYouMostInACareer,
    required final String doYouPreferWorking,
    required final String doYouLikeJobsThatInvolve,
    required final String howDoYouFeelAboutDeadlines,
    required final String wouldYouRather,
    required final String whatKindOfJobStructureDoYouPrefer,
    required final String wouldYouEnjoyACareerWhereYou,
    required final String wouldYouLikeToTravelForWork,
    required final String whatWouldMakeYouHappiestInAJob,
    required final String doYouEnjoyWorkingWithTechnology,
    required final String areYouInterestedInHealthcareOrMedicine,
    required final String wouldYouLikeToWorkInEducationOrTeaching,
    required final String doYouEnjoyResearchAndAnalysis,
    required final String areYouInterestedInPsychologyOrCounseling,
    required final String wouldYouLikeACareerInMediaOrFilmOrEntertainment,
    required final String whatIsMoreImportantToYouInAJob,
    required final String wouldYouRatherDo,
    required final String whatKindOfEmployerDoYouPrefer,
    required final String whereWouldYouRatherWork,
    required final String areYouMoreOfA,
    required final String doYouPrefer,
    required void Function(UserResponseModel updatedUserResponse) onUserUpdated,
  }) async {
    state = const AsyncData(UpdatingUserState());
    state = await AsyncValue.guard(
      () async {
        final updateUserResult = await ref.watch(apiHelperProvider).updateUser(
              userId: userId,
              whatCourseDoYouNeed: whatCourseDoYouNeed,
              doYouNeedCareerCounselling: doYouNeedCareerCounselling,
              whatDoYouDo: whatDoYouDo,
              wouldYouLikeToBeACareerCounsellor: wouldYouLikeToBeACareerCounsellor,
              whichActivityDoYouEnjoyTheMost: whichActivityDoYouEnjoyTheMost,
              whatKindOfChallengesExciteYou: whatKindOfChallengesExciteYou,
              doYouPreferWorkingWith: doYouPreferWorkingWith,
              whatDoYouEnjoyDoingInYourFreeTime: whatDoYouEnjoyDoingInYourFreeTime,
              whatComesNaturallyToYou: whatComesNaturallyToYou,
              whichSubjectWouldYouEnjoyTheMost: whichSubjectWouldYouEnjoyTheMost,
              whatKindOfWorkEnvironmentSuitsYou: whatKindOfWorkEnvironmentSuitsYou,
              howDoYouApproachProblems: howDoYouApproachProblems,
              whichSkillAreYouBestAt: whichSkillAreYouBestAt,
              whatMotivatesYouMostInACareer: whatMotivatesYouMostInACareer,
              doYouPreferWorking: doYouPreferWorking,
              doYouLikeJobsThatInvolve: doYouLikeJobsThatInvolve,
              howDoYouFeelAboutDeadlines: howDoYouFeelAboutDeadlines,
              wouldYouRather: wouldYouRather,
              whatKindOfJobStructureDoYouPrefer: whatKindOfJobStructureDoYouPrefer,
              wouldYouEnjoyACareerWhereYou: wouldYouEnjoyACareerWhereYou,
              wouldYouLikeToTravelForWork: wouldYouLikeToTravelForWork,
              whatWouldMakeYouHappiestInAJob: whatWouldMakeYouHappiestInAJob,
              doYouEnjoyWorkingWithTechnology: doYouEnjoyWorkingWithTechnology,
              areYouInterestedInHealthcareOrMedicine: areYouInterestedInHealthcareOrMedicine,
              wouldYouLikeToWorkInEducationOrTeaching: wouldYouLikeToWorkInEducationOrTeaching,
              doYouEnjoyResearchAndAnalysis: doYouEnjoyResearchAndAnalysis,
              areYouInterestedInPsychologyOrCounseling: areYouInterestedInPsychologyOrCounseling,
              wouldYouLikeACareerInMediaOrFilmOrEntertainment:
                  wouldYouLikeACareerInMediaOrFilmOrEntertainment,
              whatIsMoreImportantToYouInAJob: whatIsMoreImportantToYouInAJob,
              wouldYouRatherDo: wouldYouRatherDo,
              whatKindOfEmployerDoYouPrefer: whatKindOfEmployerDoYouPrefer,
              whereWouldYouRatherWork: whereWouldYouRatherWork,
              areYouMoreOfA: areYouMoreOfA,
              doYouPrefer: doYouPrefer,
            );

        return updateUserResult.when(
          (updateUserResponse) async {
            if (updateUserResponse.user?.feedback != null) {
              //getting the current verified user response, where the "name" field was empty
              final currentVerifiedModel = ref.read(loginDbProvider).getLoginModel();
              //updating the "isEmailExist" field in verifyOtpDb for login guards
              await ref.read(loginDbProvider).saveLoginModel(
                    userResponseModel: currentVerifiedModel!.copyWith(
                      //set isEmailExist field to true
                      user: currentVerifiedModel.user!.copyWith(
                        whatCourseDoYouNeed: updateUserResponse.user!.whatCourseDoYouNeed,
                        // feedback: currentVerifiedModel.user!.feedback?.copyWith(
                        //   wouldYouLikeACareerInMediaFilmOrEntertainment: updateUserResponse
                        //       .user!.feedback!.wouldYouLikeACareerInMediaFilmOrEntertainment,
                        //   whichActivityDoYouEnjoyTheMost:
                        //       updateUserResponse.user!.feedback!.whichActivityDoYouEnjoyTheMost,
                        //   whatKindOfChallengesExciteYou:
                        //       updateUserResponse.user!.feedback!.whatKindOfChallengesExciteYou,
                        //   doYouPreferWorkingWith:
                        //       updateUserResponse.user!.feedback!.doYouPreferWorkingWith,
                        //   whatDoYouEnjoyDoingInYourFreeTime:
                        //       updateUserResponse.user!.feedback!.whatDoYouEnjoyDoingInYourFreeTime,
                        //   whatComesNaturallyToYou:
                        //       updateUserResponse.user!.feedback!.whatComesNaturallyToYou,
                        //   whichSubjectWouldYouEnjoyTheMost:
                        //       updateUserResponse.user!.feedback!.whichSubjectWouldYouEnjoyTheMost,
                        //   whatKindOfWorkEnvironmentSuitsYou:
                        //       updateUserResponse.user!.feedback!.whatKindOfWorkEnvironmentSuitsYou,
                        //   howDoYouApproachProblems:
                        //       updateUserResponse.user!.feedback!.howDoYouApproachProblems,
                        //   whichSkillAreYouBestAt:
                        //       updateUserResponse.user!.feedback!.whichSkillAreYouBestAt,
                        //   whatMotivatesYouMostInACareer:
                        //       updateUserResponse.user!.feedback!.whatMotivatesYouMostInACareer,
                        //   doYouPreferWorking: updateUserResponse.user!.feedback!.doYouPreferWorking,
                        //   doYouLikeJobsThatInvolve:
                        //       updateUserResponse.user!.feedback!.doYouLikeJobsThatInvolve,
                        //   howDoYouFeelAboutDeadlines:
                        //       updateUserResponse.user!.feedback!.howDoYouFeelAboutDeadlines,
                        //   wouldYouRather: updateUserResponse.user!.feedback!.wouldYouRather,
                        //   whatKindOfJobStructureDoYouPrefer:
                        //       updateUserResponse.user!.feedback!.whatKindOfJobStructureDoYouPrefer,
                        //   wouldYouEnjoyACareerWhereYou:
                        //       updateUserResponse.user!.feedback!.wouldYouEnjoyACareerWhereYou,
                        //   wouldYouLikeToTravelForWork:
                        //       updateUserResponse.user!.feedback!.wouldYouLikeToTravelForWork,
                        //   whatWouldMakeYouHappiestInAJob:
                        //       updateUserResponse.user!.feedback!.whatWouldMakeYouHappiestInAJob,
                        //   doYouEnjoyWorkingWithTechnology:
                        //       updateUserResponse.user!.feedback!.doYouEnjoyWorkingWithTechnology,
                        //   areYouInterestedInHealthcareOrMedicine: updateUserResponse
                        //       .user!.feedback!.areYouInterestedInHealthcareOrMedicine,
                        //   wouldYouLikeToWorkInEducationOrTeaching: updateUserResponse
                        //       .user!.feedback!.wouldYouLikeToWorkInEducationOrTeaching,
                        //   doYouEnjoyResearchAndAnalysis:
                        //       updateUserResponse.user!.feedback!.doYouEnjoyResearchAndAnalysis,
                        //   areYouInterestedInPsychologyOrCounseling: updateUserResponse
                        //       .user!.feedback!.areYouInterestedInPsychologyOrCounseling,
                        //   whatIsMoreImportantToYouInAJob:
                        //       updateUserResponse.user!.feedback!.whatIsMoreImportantToYouInAJob,
                        //   wouldYouRatherDo: updateUserResponse.user!.feedback!.wouldYouRatherDo,
                        //   whatKindOfEmployerDoYouPrefer:
                        //       updateUserResponse.user!.feedback!.whatKindOfEmployerDoYouPrefer,
                        //   whereWouldYouRatherWork:
                        //       updateUserResponse.user!.feedback!.whereWouldYouRatherWork,
                        //   areYouMoreOfA: updateUserResponse.user!.feedback!.areYouMoreOfA,
                        //   doYouPrefer: updateUserResponse.user!.feedback!.doYouPrefer,
                        // ),
                      ),
                    ),
                  );
              onUserUpdated(updateUserResponse);
              return const UpdatedUserState();
            } else {
              return const NotUpdatedUserState();
            }
          },
          (error) => UpdateUserErrorState(
            error.errorMessage,
          ),
        );
      },
    );
  }
}
