class Food {
  final String foodId;
  final String foodName;
  final String foodImageName;
  final String foodPrice;

  Food(this.foodId, this.foodName, this.foodImageName, this.foodPrice);

  Food.fromJson(Map<String, dynamic> json)
      : foodId = json['yemek_id'],
        foodName = json['yemek_adi'],
        foodImageName = json['yemek_resim_adi'],
        foodPrice = json['yemek_fiyat'];

  Map<String, dynamic> toJson() => {
        'yemek_id': foodId,
        'yemek_adi': foodName,
        'yemek_resim_adi': foodImageName,
        'yemek_fiyat': foodPrice
      };
}
// factory Food.fromJson(Map<String, dynamic> json) {
//   return Food(
//       yemek_id: json['yemek_id'] as String,
//       yemek_adi: json['yemek_adi'] as String,
//       yemek_resim_adi: json['yemek_resim_adi'] as String,
//       yemek_fiyat: json['yemek_fiyat'] as String);
// }
