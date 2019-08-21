// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: proto.fbe
// Version: 1.3.0.0


import fbe

import Foundation

// Fast Binary Encoding com.chronoxor.proto final sender
open class FinalSender : fbe.SenderProtocol { 
    // Sender models accessors
    private let OrderModel: OrderFinalModel
    private let BalanceModel: BalanceFinalModel
    private let AccountModel: AccountFinalModel

    public var buffer: Buffer = Buffer()
    public var logging: Bool = false
    public var final: Bool = false

    public init() {
        OrderModel = proto.OrderFinalModel(buffer: buffer)
        BalanceModel = proto.BalanceFinalModel(buffer: buffer)
        AccountModel = proto.AccountFinalModel(buffer: buffer)
        build(with: true)
    }

    public init(buffer: fbe.Buffer) {
        OrderModel = proto.OrderFinalModel(buffer: buffer)
        BalanceModel = proto.BalanceFinalModel(buffer: buffer)
        AccountModel = proto.AccountFinalModel(buffer: buffer)
        build(with: buffer, final: true)
    }

    public func send(obj: Any) throws -> Int {
        switch obj {
            case is proto.Order: return try send(value: obj as! proto.Order)
            case is proto.Balance: return try send(value: obj as! proto.Balance)
            case is proto.Account: return try send(value: obj as! proto.Account)
            default: break
        }

        return 0
    }

    public func send(value: proto.Order) throws -> Int {
        // Serialize the value into the FBE stream
        let serialized = try OrderModel.serialize(value: value)
        assert(serialized > 0, "proto.Order serialization failed!")
        assert(OrderModel.verify(), "proto.Order validation failed!")

        // Log the value
        if logging {
            let message = value.description
            onSendLog(message: message)
        }

        // Send the serialized value
        return try sendSerialized(serialized: serialized)
    }
    public func send(value: proto.Balance) throws -> Int {
        // Serialize the value into the FBE stream
        let serialized = try BalanceModel.serialize(value: value)
        assert(serialized > 0, "proto.Balance serialization failed!")
        assert(BalanceModel.verify(), "proto.Balance validation failed!")

        // Log the value
        if logging {
            let message = value.description
            onSendLog(message: message)
        }

        // Send the serialized value
        return try sendSerialized(serialized: serialized)
    }
    public func send(value: proto.Account) throws -> Int {
        // Serialize the value into the FBE stream
        let serialized = try AccountModel.serialize(value: value)
        assert(serialized > 0, "proto.Account serialization failed!")
        assert(AccountModel.verify(), "proto.Account validation failed!")

        // Log the value
        if logging {
            let message = value.description
            onSendLog(message: message)
        }

        // Send the serialized value
        return try sendSerialized(serialized: serialized)
    }

    // Send message handler
    open func onSend(buffer: Data, offset: Int, size: Int) throws -> Int { throw NSError() }
}
