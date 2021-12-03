from pyteal import *


on_create = Cond(
    App.globalPut(bytes("Grassland"), bytes("1000")),
    App.globalPut(bytes("Hummingbird"), bytes("500")),
    App.globalPut(bytes("Mountain"), bytes("1230")),
    App.globalPut(bytes("Sunset"), bytes("750")),
    Approve(),
)

on_create_event = Seq(
    App.globalPut(Txn.application_args[1], Txn.application_args[2]),
    Approve(),
)

on_buy = Seq(
    App.globalPut(Txn.application_args[1], Txn.application_args[2]),
    Approve(),
)

on_call_method = Txn.application_args[0]
on_call = Cond(
    [on_call_method == Bytes("create_event"), on_create_event],
    [on_call_method == Bytes("buy"), on_buy],
)

program = Cond(
    [Txn.application_id() == Int(0), on_create],
    [Txn.on_completion() == OnComplete.NoOp, on_call],
)



