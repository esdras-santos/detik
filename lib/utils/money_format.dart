class MoneyFormat {
  String value;
  MoneyFormat(this.value);
  String formatToString() {
    if (value.contains(".")) {
      var valuelist = [];
      for (int i = 0; i < value.length; i++) {
        valuelist.add(value[i]);
      }
      for (int i = 0; i < valuelist.length; i++) {
        if (valuelist[i] == '.') {
          valuelist[i] = ',';
        }
      }
      String value1 = " ";
      valuelist.forEach((item) {
        value1 = value1 + item;
      });
      value = value1;
      return "R\$" + value + "";
    } else if (!value.contains(",")) {
      return "R\$ " + value + ",00";
    }
    return "R\$ " + value;
  }

  double formatToDouble() {
    if (value.contains(",")) {
      var valuelist = [];
      for (int i = 0; i < value.length; i++) {
        valuelist.add(value[i]);
      }
      for (int i = 0; i < valuelist.length; i++) {
        if (valuelist[i] == ',') {
          valuelist[i] = '.';
        }
      }
      value = valuelist.toString();
    }
    return double.parse(value);
  }
}