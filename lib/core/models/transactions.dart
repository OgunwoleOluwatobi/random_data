import 'package:random_data/core/models/client_transactions.dart';

class Transactions {
  List<ClientTransactions>? clientTransactions;

  Transactions({this.clientTransactions});

  Transactions.fromJson(Map<String, dynamic> json) {
    if (json['clientTransactions'] != null) {
      clientTransactions = <ClientTransactions>[];
      json['clientTransactions'].forEach((v) {
        clientTransactions!.add(new ClientTransactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientTransactions != null) {
      data['clientTransactions'] =
          this.clientTransactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
