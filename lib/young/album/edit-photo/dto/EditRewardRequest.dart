class EditRewardRequest {
  int rewardIdx;
  String description;
  String type;

  EditRewardRequest({
    required this.rewardIdx,
    required this.description,
    required this.type,
  });
}