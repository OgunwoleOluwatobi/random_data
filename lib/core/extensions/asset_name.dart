extension AssetName on String {
  String get svg => 'assets/svg/$this.svg';
  String get png => 'assets/image/$this.png';
  bool get isPasswordValid => RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z@$!%*?&]{8,15}$").hasMatch(this);
  bool get passwordHasSmallLetters => RegExp(r"^(?=.[a-z])").hasMatch(this);
  bool get passwordHasCapitalLetters => RegExp(r"^(?=.*[A-Z])").hasMatch(this);
  bool get passwordHasSymbols => RegExp(r"^(?=.*[@$!%*#?&.',;])[A-Za-z\d@$!%*#?&]").hasMatch(this);
  bool get passwordHasNumber => RegExp(r"^(?=.*\d){8,15}$").hasMatch(this);
  bool get between8and15 => RegExp(r"^(){8,15}").hasMatch(this);
  String capitalizeFirst() {
    if(isEmpty) return this;
    String temp = '';
    for(String item in split(' ')) {
      if(item.isEmpty) {
        temp = '$temp $item';
      } else {
        if(item.length >= 2){
          temp+="${item[0].toUpperCase()}${item.substring(1).toLowerCase()}${split(' ').indexOf(item) == split(' ').length-1 ? '' : ' '}";
        }else {
          temp += '${item[0].toUpperCase()}';
        }
      }
    }
    return temp;
  } 
}