
// API isimleri ve icerik Turkce yazildigi icin Turkce kullanilmistir.

enum UrlPaths {
  tumYemekleriGetir,
  sepeteYemekEkle,
  sepettekiYemekleriGetir,
  sepettenYemekSil,
  resimler
}
extension UrlPathsExtension on UrlPaths{
  String value(){
    switch(this){
      case UrlPaths.tumYemekleriGetir:
        return UrlPaths.tumYemekleriGetir.toString();
      case UrlPaths.sepeteYemekEkle:
        return UrlPaths.sepeteYemekEkle.toString();
      case UrlPaths.sepettekiYemekleriGetir:
        return UrlPaths.sepettekiYemekleriGetir.toString();
      case UrlPaths.sepettenYemekSil:
        return UrlPaths.sepettenYemekSil.toString();
      case UrlPaths.resimler:
        return UrlPaths.resimler.toString();
    }
  }
}