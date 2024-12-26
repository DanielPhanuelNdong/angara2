// To parse this JSON data, do
//
//     final modelSocket = modelSocketFromJson(jsonString);

import 'dart:convert';

ModelSocket modelSocketFromJson(String str) =>
    ModelSocket.fromJson(json.decode(str));

String modelSocketToJson(ModelSocket data) => json.encode(data.toJson());

class ModelSocket {
  int code;
  bool head;
  int type;
  Body body;

  ModelSocket({
    required this.code,
    required this.head,
    required this.type,
    required this.body,
  });

  @override
  String toString() {
    return '''
ModelSocket(
  code: $code,
  head: $head,
  type: $type,
  body: $body
)''';
  }

  factory ModelSocket.fromJson(Map<String, dynamic> json) => ModelSocket(
        code: json["code"],
        head: json["head"],
        type: json["type"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "head": head,
        "type": type,
        "body": body.toJson(),
      };
}

class Body {
  String codeserv;
  Transaction transaction;

  Body({
    required this.codeserv,
    required this.transaction,
  });

  @override
  String toString() {
    return '''
Body(
  codeserv: $codeserv,
  transaction: $transaction
)''';
  }

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        codeserv: json["codeserv"],
        transaction: Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "codeserv": codeserv,
        "transaction": transaction.toJson(),
      };
}

class Transaction {
  String codetrans;
  String statut;
  String soldewallet;
  String codeclient;
  String montantrans;
  String statutrans;
  String nomcommis;
  String tauxcommis;
  String typepart;
  dynamic numtelmomo;
  String intitulewalletpart;
  String frais;
  String total;
  String nouveausolde;

  Transaction({
    required this.codetrans,
    required this.statut,
    required this.soldewallet,
    required this.codeclient,
    required this.montantrans,
    required this.statutrans,
    required this.nomcommis,
    required this.tauxcommis,
    required this.typepart,
    required this.numtelmomo,
    required this.intitulewalletpart,
    required this.frais,
    required this.total,
    required this.nouveausolde,
  });

  @override
  String toString() {
    return '''
Transaction(
  codetrans: $codetrans,
  statut: $statut,
  soldewallet: $soldewallet,
  codeclient: $codeclient,
  montantrans: $montantrans,
  statutrans: $statutrans,
  nomcommis: $nomcommis,
  tauxcommis: $tauxcommis,
  typepart: $typepart,
  numtelmomo: $numtelmomo,
  intitulewalletpart: $intitulewalletpart,
  frais: $frais,
  total: $total,
  nouveausolde: $nouveausolde
)''';
  }

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        codetrans: json["codetrans"],
        statut: json["statut"],
        soldewallet: json["soldewallet"],
        codeclient: json["codeclient"],
        montantrans: json["montantrans"],
        statutrans: json["statutrans"],
        nomcommis: json["nomcommis"],
        tauxcommis: json["tauxcommis"],
        typepart: json["typepart"],
        numtelmomo: json["numtelmomo"],
        intitulewalletpart: json["intitulewalletpart"],
        frais: json["frais"],
        total: json["total"],
        nouveausolde: json["nouveausolde"],
      );

  Map<String, dynamic> toJson() => {
        "codetrans": codetrans,
        "statut": statut,
        "soldewallet": soldewallet,
        "codeclient": codeclient,
        "montantrans": montantrans,
        "statutrans": statutrans,
        "nomcommis": nomcommis,
        "tauxcommis": tauxcommis,
        "typepart": typepart,
        "numtelmomo": numtelmomo,
        "intitulewalletpart": intitulewalletpart,
        "frais": frais,
        "total": total,
        "nouveausolde": nouveausolde,
      };
}
