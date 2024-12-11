class PetModel {
  final String petName;
  final List<dynamic> petImages;
  final String petId;
  final String petCategory;
  final String petDescription;
  final String petSex;
  final String petBreed;
  final String petLocation;
  final String petAge;
  final int petNum;

  PetModel({
    required this.petCategory,
    required this.petDescription,
    required this.petId,
    required this.petImages,
    required this.petName,
    required this.petSex,
    required this.petAge,
    required this.petBreed,
    required this.petLocation,
    required this.petNum,
  });

  factory PetModel.fromJson(json) => PetModel(
        petCategory: json["petCategory"],
        petDescription: json["petDescription"],
        petId: json["petId"],
        petImages: json["petImages"],
        petName: json["petName"],
        petSex: json["petSex"],
        petAge: json["petAge"],
        petBreed: json["petBreed"],
        petLocation: json["petLocation"],
        petNum: json["petNum"],
      );
}
