class Cart {
  final String cartFoodId;
  final String foodName;
  final String foodImageName;
  final String foodPrice;
  final String foodOrderCount;
  final String userName;

  Cart(this.cartFoodId, this.foodName, this.foodImageName, this.foodPrice,
      this.foodOrderCount, this.userName);

  Cart.fromJson(Map<String, dynamic> json)
      : cartFoodId = json['sepet_yemek_id'],
        foodName = json['yemek_adi'],
        foodImageName = json['yemek_resim_adi'],
        foodPrice = json['yemek_fiyat'],
        foodOrderCount = json['yemek_siparis_adet'],
        userName = json['kullanici_adi'];

  Map<String, dynamic> toJson() => {
    'sepet_yemek_id':cartFoodId,
    'yemek_adi':foodName,
    'yemek_resim_adi':foodImageName,
    'yemek_fiyat':foodPrice,
    'yemek_siparis_adet':foodOrderCount,
    'kullanici_adi':userName,
  };

  // factory Sepet.fromJson(Map<String, dynamic> json){
  //   return Sepet(
  //       sepet_yemek_id: json['sepet_yemek_id'] as String ,
  //       yemek_adi: json['yemek_adi'] as String,
  //       yemek_resim_adi: json['yemek_resim_adi'] as String,
  //       yemek_fiyat: json['yemek_fiyat'] as String,
  //       yemek_siparis_adet: json['yemek_siparis_adet'] as String,
  //       kullanici_adi: json['kullanici_adi'] as String
  //   );
  // }

}
