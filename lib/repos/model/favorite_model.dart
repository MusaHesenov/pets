class FavoriteModel {
  final String favoriteName;
  final List<dynamic> favoriteImage;
  final String favoriteId;
  final String productDescription;
  final String fpetSex;
  final String fpetBreed;
  final String fpetLocation;
  final String fpetAge;
  final int fpetNum;

  int favoriteQuantity = 1;

  FavoriteModel({
    required this.productDescription,
    required this.favoriteImage,
    required this.favoriteId,
    required this.favoriteName,
    required this.fpetSex,
    required this.fpetAge,
    required this.fpetBreed,
    required this.fpetLocation,
    required this.fpetNum,
    required this.favoriteQuantity,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> item) {
    return FavoriteModel(
      favoriteImage: item["favoriteImage"],
      favoriteName: item["favoriteName"],
      favoriteQuantity: item["favoriteQuantity"],
      productDescription: item["productDescription"],
      favoriteId: item["favoriteId"],
      fpetSex: item["fpetSex"],
      fpetAge: item["fpetAge"],
      fpetBreed: item["fpetBreed"],
      fpetLocation: item["fpetLocation"],
      fpetNum: item["fpetNum"],
    );
  }

  static Map<String, dynamic> toMap(FavoriteModel item) => {
        'favoriteImage': item.favoriteImage,
        'favoriteName': item.favoriteName,
        'favoriteQuantity': item.favoriteQuantity,
        "favoriteId": item.favoriteId,
        'productDescription': item.productDescription,
        "fpetSex": item.fpetSex,
        "fpetAge": item.fpetAge,
        "fpetBreed": item.fpetBreed,
        "fpetLocation": item.fpetLocation,
        "fpetNum": item.fpetNum,
      };
}
