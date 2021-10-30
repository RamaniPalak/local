var emailRegex =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
var nameRegex = r'[0–9]';

extension DateFormat on DateTime {

  String toStrCommonFormat(){
    return this.day.toString() + '/${this.month.toString()}' + '/${this.year.toString()}';
  }

}

extension OptionalString on String? {

  String checkForNull({String? diff}){
    if (this == null){
      return diff ?? 'N/A';
    }
    return this!;
  }

}

extension ExtendedString on String {

  String safeIndexStrFrom(int index){
    try {
      return this[index];
    } catch (e) {
      return '';
    }
  }

  bool get isValidName {
    return !this.contains(new RegExp(nameRegex));
  }

  bool get isValidEmail {
    return this.contains(new RegExp(emailRegex));
  }

  bool get isValidMobile {
    return this.length >= 7 && this.length <= 13;
  }

  bool get isValidPassword {
    return this.length >= 8;
  }

  int parseInt() {
    try {
      return int.parse(this);
    } catch (err) {
      return 0;
    }
  }

  double parseDouble() {
    try {
      return double.parse(this);
    } catch (err) {
      return 0.0;
    }
  }

}