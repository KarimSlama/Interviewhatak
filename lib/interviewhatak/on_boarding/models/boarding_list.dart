import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/models/boarding_model.dart';

List<BoardingModel> boarding = [
  BoardingModel(
    image: 'assets/images/interview_1.png',
    title: AppString.prepareInspireYourself,
    body: AppString.inteviewhatakMakeYouAwareOfManyMattersRelatedToYourField,
  ),
  BoardingModel(
    image: 'assets/images/interview_2.png',
    title: AppString.beSureOfYourself,
    body:
        AppString.inteviewhatakWillTrustYouThroughPracticeWithMoreQuestions,
  ),
  BoardingModel(
    image: 'assets/images/interview_3.png',
    title: AppString.receiveAnOfferToWork,
    body: AppString
        .interviewhatakWillEnableYouToGetTheWorkYouWishToGetThroughoutTheTime,
  ),
];
