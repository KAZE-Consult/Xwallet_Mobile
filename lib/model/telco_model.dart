// ignore_for_file: public_member_api_docs, sort_constructors_first
class TelcoModel {
  int? id;
  String? logoPath;
  String? title;
  TelcoModel({
    this.id,
    this.logoPath,
    this.title,
  }) {
    if (id == 1) {
      title = 'GLO';
      logoPath = 'assets/icons/glo.png';
    } else if (id == 2) {
      title = 'MTN';
      logoPath = 'assets/icons/mtn.svg';
    } else if (id == 3) {
      title = 'AIRTEL';
      logoPath = 'assets/icons/airtel.png';
    } else if (id == 4) {
      title = '9MOBILE';
      logoPath = 'assets/icons/nine_mobile.png';
    }
  }
}

//np means network provider
TelcoModel? getTecloByTitle(String? val) {
  switch (val?.toLowerCase()) {
    case 'glo':
      return TelcoModel(id: 1);
    case 'mtn':
      return TelcoModel(id: 2);
    case 'airtel':
      return TelcoModel(id: 3);
    case '9mobile':
      return TelcoModel(id: 4);
    default:
      return null;
  }
}

TelcoModel? getTelcoById(int? val) {
  if (val == null) return null;
  return TelcoModel(id: val);
}
