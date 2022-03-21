class ClientTransactions {
  int? transactionId;
  String? type;
  double? amount;
  String? comment;
  String? entryDate;
  String? currencyCode;
  String? balance;

  ClientTransactions(
      {this.transactionId,
      this.type,
      this.amount,
      this.comment,
      this.entryDate,
      this.currencyCode,
      this.balance});

  ClientTransactions.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    type = json['type'];
    amount = json['amount'].toDouble();
    comment = json['comment'];
    entryDate = json['entryDate'];
    currencyCode = json['currencyCode'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['comment'] = this.comment;
    data['entryDate'] = this.entryDate;
    data['currencyCode'] = this.currencyCode;
    data['balance'] = this.balance;
    return data;
  }
}
