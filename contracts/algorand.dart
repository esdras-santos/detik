import 'package:algorand_dart/algorand_dart.dart';

const String apiKey = "PfnqW3Fhko5otXC7SDrah89enw41gNSO2kBeMNw0";

final algodClient = AlgodClient(
  apiUrl: PureStake.TESTNET_ALGOD_API_URL,
  apiKey: apiKey,
  tokenKey: PureStake.API_TOKEN_HEADER,
);

final indexerClient = IndexerClient(
  apiUrl: PureStake.TESTNET_INDEXER_API_URL,
  apiKey: apiKey,
  tokenKey: PureStake.API_TOKEN_HEADER,
);

final kmdClient = KmdClient(
  apiUrl: '127.0.0.1',
  apiKey: apiKey,
);

final algorand = Algorand(
  algodClient: algodClient,
  indexerClient: indexerClient,
  kmdClient: kmdClient,
);

var approval, clear = getContracts()

Future<Account> newAccount() async {
  final account = await algorand.createAccount();
  return account;
}

void buy(String eventName, String pk, String sig, Account acc) async {
  final arguments =
      'str:buy ,str:$sig, str:$pk, str:$eventName'.toApplicationArguments();
  final params = await algorand.getSuggestedTransactionParams();
  var event = await algorand
      .indexer()
      .getApplicationById(19964146)
      .then((value) => value.toJson());
  var eventPrice = int.parse(event['$eventName']);
  var balance = await algorand.getBalance(acc.address.toString());
  if (balance > eventPrice){
    final transaction = await (ApplicationCallTransactionBuilder()
        ..sender = acc.address
        ..applicationId = 19964146
        ..arguments = arguments
        ..suggestedParams = params)
      .build();

    final signedTx = await transaction.sign(acc);
    final txId = await algorand.sendTransaction(
      signedTx,
      waitForConfirmation: true,
    );
    await algorand.sendPayment(
      account: acc,
      recipient: contractaddress,
      amount: Algo.toMicroAlgos(eventPrice.toDouble()),
    );
  }
  
}

Future<Map<String, dynamic>> dapp() async{
  return await algorand
      .indexer()
      .getApplicationById(19964146)
      .then((value) => value.toJson());
}
