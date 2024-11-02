// To parse this JSON data, do
//
//     final registerModelTrue = registerModelTrueFromJson(jsonString);

import 'dart:convert';

RegisterModelTrue registerModelTrueFromJson(String str) =>
    RegisterModelTrue.fromJson(json.decode(str));

String registerModelTrueToJson(RegisterModelTrue data) =>
    json.encode(data.toJson());

class RegisterModelTrue {
  int? code;
  bool? head;
  int? type;
  Body? body;

  RegisterModelTrue({
    required this.code,
    this.head,
    this.type,
    this.body,
  });

  factory RegisterModelTrue.fromJson(Map<String, dynamic> json) =>
      RegisterModelTrue(
        code: json["code"],
        head: json["head"],
        type: json["type"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "head": head,
        "type": type,
        "body": body,
      };
}

class Body {
  String? codeenreg;
  String? otpenreg;
  String? mail;
  String? msg;
  String? codewallet;
  String? intitulewallet;
  String? soldewallet;
  String? statutwallet;
  String? codeclient;
  String? codeutilis;
  String? codetrans;
  String? statut;
  String? montantrans;
  String? statutrans;
  String? nomcommis;
  String? tauxcommis;
  String? typepart;
  String? numtelmomo;
  String? intitulewalletpart;
  Connexion? connexion;
  Client? client;
  Wallet? wallet;
  Transaction? transactioncredit;
  Transaction? transactiondebit;

  Body({
    this.codeenreg,
    this.otpenreg,
    this.mail,
    this.msg,
    this.connexion,
    this.client,
    this.wallet,
    this.codewallet,
    this.intitulewallet,
    this.soldewallet,
    this.statutwallet,
    this.codeclient,
    this.codeutilis,
    this.codetrans,
    this.statut,
    this.montantrans,
    this.statutrans,
    this.nomcommis,
    this.tauxcommis,
    this.typepart,
    this.numtelmomo,
    this.intitulewalletpart,
    this.transactioncredit,
    this.transactiondebit,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        codeenreg: json["codeenreg"],
        otpenreg: json["otpenreg"],
        mail: json["mail"],
        msg: json["msg"],
        codewallet: json["codewallet"],
        intitulewallet: json["intitulewallet"],
        soldewallet: json["soldewallet"],
        statutwallet: json["statutwallet"],
        codeclient: json["codeclient"],
        codeutilis: json["codeutilis"],
        codetrans: json["codetrans"],
        statut: json["statut"],
        montantrans: json["montantrans"],
        statutrans: json["statutrans"],
        nomcommis: json["nomcommis"],
        tauxcommis: json["tauxcommis"],
        typepart: json["typepart"],
        numtelmomo: json["numtelmomo"],
        intitulewalletpart: json["intitulewalletpart"],
        connexion: json["connexion"] != null
            ? Connexion.fromJson(json["connexion"])
            : null,
        client: json["client"] != null ? Client.fromJson(json["client"]) : null,
        wallet: json["wallet"] != null ? Wallet.fromJson(json["wallet"]) : null,
        transactioncredit: json["transactioncredit"] != null
            ? Transaction.fromJson(json["transactioncredit"])
            : null,
        transactiondebit: json["transactiondebit"] != null
            ? Transaction.fromJson(json["transactiondebit"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "codeenreg": codeenreg,
        "otpenreg": otpenreg,
        "mail": mail,
        "msg": msg,
        "codewallet": codewallet,
        "intitulewallet": intitulewallet,
        "soldewallet": soldewallet,
        "statutwallet": statutwallet,
        "codeclient": codeclient,
        "codeutilis": codeutilis,
        "codetrans": codetrans,
        "statut": statut,
        "montantrans": montantrans,
        "statutrans": statutrans,
        "nomcommis": nomcommis,
        "tauxcommis": tauxcommis,
        "typepart": typepart,
        "numtelmomo": numtelmomo,
        "intitulewalletpart": intitulewalletpart,
        "connexion": connexion?.toJson(),
        "client": client?.toJson(),
        "wallet": wallet?.toJson(),
        "transactioncredit": transactioncredit?.toJson(),
        "transactiondebit": transactiondebit?.toJson(),
      };
}

class Client {
  String? codeclient;
  String? pinclient;
  String? codeutilis;
  String? nomsutilis;
  String? prenomsutilis;
  String? numtelutilis;
  String? emailutilis;
  String? codenreg;
  String? codecompte;
  String? nomcompte;
  String? logincompte;
  String? statutcompte;

  Client({
    this.codeclient,
    this.pinclient,
    this.codeutilis,
    this.nomsutilis,
    this.prenomsutilis,
    this.numtelutilis,
    this.emailutilis,
    this.codenreg,
    this.codecompte,
    this.nomcompte,
    this.logincompte,
    this.statutcompte,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        codeclient: json["codeclient"],
        pinclient: json["pinclient"],
        codeutilis: json["codeutilis"],
        nomsutilis: json["nomsutilis"],
        prenomsutilis: json["prenomsutilis"],
        numtelutilis: json["numtelutilis"],
        emailutilis: json["emailutilis"],
        codenreg: json["codenreg"],
        codecompte: json["codecompte"],
        nomcompte: json["nomcompte"],
        logincompte: json["logincompte"],
        statutcompte: json["statutcompte"],
      );

  Map<String, dynamic> toJson() => {
        "codeclient": codeclient,
        "pinclient": pinclient,
        "codeutilis": codeutilis,
        "nomsutilis": nomsutilis,
        "prenomsutilis": prenomsutilis,
        "numtelutilis": numtelutilis,
        "emailutilis": emailutilis,
        "codenreg": codenreg,
        "codecompte": codecompte,
        "nomcompte": nomcompte,
        "logincompte": logincompte,
        "statutcompte": statutcompte,
      };
}

class Connexion {
  String? codeconn;
  DateTime? datedebconn;
  dynamic datefinconn;
  String? nomtermconn;
  String? adripconn;
  dynamic adrmaconn;
  String? statutconn;
  String? codecompte;
  String? nomcompte;
  String? logincompte;
  String? statutcompte;
  String? codesptrav;
  String? nomesptrav;
  String? lienesptrav;
  String? libesptrav;

  Connexion({
    this.codeconn,
    this.datedebconn,
    this.datefinconn,
    this.nomtermconn,
    this.adripconn,
    this.adrmaconn,
    this.statutconn,
    this.codecompte,
    this.nomcompte,
    this.logincompte,
    this.statutcompte,
    this.codesptrav,
    this.nomesptrav,
    this.lienesptrav,
    this.libesptrav,
  });

  factory Connexion.fromJson(Map<String, dynamic> json) => Connexion(
        codeconn: json["codeconn"],
        datedebconn: DateTime.parse(json["datedebconn"]),
        datefinconn: json["datefinconn"],
        nomtermconn: json["nomtermconn"],
        adripconn: json["adripconn"],
        adrmaconn: json["adrmaconn"],
        statutconn: json["statutconn"],
        codecompte: json["codecompte"],
        nomcompte: json["nomcompte"],
        logincompte: json["logincompte"],
        statutcompte: json["statutcompte"],
        codesptrav: json["codesptrav"],
        nomesptrav: json["nomesptrav"],
        lienesptrav: json["lienesptrav"],
        libesptrav: json["libesptrav"],
      );

  Map<String, dynamic> toJson() => {
        "codeconn": codeconn,
        "datedebconn": datedebconn?.toIso8601String(),
        "datefinconn": datefinconn,
        "nomtermconn": nomtermconn,
        "adripconn": adripconn,
        "adrmaconn": adrmaconn,
        "statutconn": statutconn,
        "codecompte": codecompte,
        "nomcompte": nomcompte,
        "logincompte": logincompte,
        "statutcompte": statutcompte,
        "codesptrav": codesptrav,
        "nomesptrav": nomesptrav,
        "lienesptrav": lienesptrav,
        "libesptrav": libesptrav,
      };
}

class Wallet {
  String? codewallet;
  String? intitulewallet;
  String? soldewallet;
  String? statutwallet;
  String? codeclient;
  String? codeutilis;

  Wallet({
    this.codewallet,
    this.intitulewallet,
    this.soldewallet,
    this.statutwallet,
    this.codeclient,
    this.codeutilis,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        codewallet: json["codewallet"],
        intitulewallet: json["intitulewallet"],
        soldewallet: json["soldewallet"],
        statutwallet: json["statutwallet"],
        codeclient: json["codeclient"],
        codeutilis: json["codeutilis"],
      );

  Map<String, dynamic> toJson() => {
        "codewallet": codewallet,
        "intitulewallet": intitulewallet,
        "soldewallet": soldewallet,
        "statutwallet": statutwallet,
        "codeclient": codeclient,
        "codeutilis": codeutilis,
      };
}

class Transaction {
  String? codetrans;
  String? statut;
  String? soldewallet;
  String? codeclient;
  String? montantrans;
  String? statutrans;
  String? nomcommis;
  String? tauxcommis;
  String? typepart;
  dynamic numtelmomo;
  String? intitulewalletpart;
  String? frais;
  String? total;
  String? nouveausolde;

  Transaction({
    this.codetrans,
    this.statut,
    this.soldewallet,
    this.codeclient,
    this.montantrans,
    this.statutrans,
    this.nomcommis,
    this.tauxcommis,
    this.typepart,
    this.numtelmomo,
    this.intitulewalletpart,
    this.frais,
    this.total,
    this.nouveausolde,
  });

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
