// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: protoex.fbe
// Version: 1.3.0.0

import Foundation
import ChronoxorFbe
import ChronoxorProto

// Fast Binary Encoding Protoex final client
open class FinalClient : ChronoxorFbe.ClientProtocol {
    // Imported senders
    let ProtoSender: ChronoxorProto.FinalClient

    // Imported receivers
    let ProtoReceiver: ChronoxorProto.FinalClient?

    // Client sender models accessors
    let OrderMessageSenderModel: OrderMessageFinalModel
    let BalanceMessageSenderModel: BalanceMessageFinalModel
    let AccountMessageSenderModel: AccountMessageFinalModel

    // Client receiver values accessors
    private var OrderMessageReceiverValue: ChronoxorProtoex.OrderMessage
    private var BalanceMessageReceiverValue: ChronoxorProtoex.BalanceMessage
    private var AccountMessageReceiverValue: ChronoxorProtoex.AccountMessage

    // Client receiver models accessors
    private let OrderMessageReceiverModel: OrderMessageFinalModel
    private let BalanceMessageReceiverModel: BalanceMessageFinalModel
    private let AccountMessageReceiverModel: AccountMessageFinalModel

    public var sendBuffer: Buffer = Buffer()
    public var receiveBuffer: Buffer = Buffer()
    public var logging: Bool = false
    public var final: Bool = false

    public init() {
        ProtoSender = ChronoxorProto.FinalClient(sendBuffer: sendBuffer, receiveBuffer: receiveBuffer)
        ProtoReceiver = ChronoxorProto.FinalClient(sendBuffer: sendBuffer, receiveBuffer: receiveBuffer)
        OrderMessageSenderModel = OrderMessageFinalModel(buffer: sendBuffer)
        OrderMessageReceiverValue = ChronoxorProtoex.OrderMessage()
        OrderMessageReceiverModel = OrderMessageFinalModel()
        BalanceMessageSenderModel = BalanceMessageFinalModel(buffer: sendBuffer)
        BalanceMessageReceiverValue = ChronoxorProtoex.BalanceMessage()
        BalanceMessageReceiverModel = BalanceMessageFinalModel()
        AccountMessageSenderModel = AccountMessageFinalModel(buffer: sendBuffer)
        AccountMessageReceiverValue = ChronoxorProtoex.AccountMessage()
        AccountMessageReceiverModel = AccountMessageFinalModel()
        build(with: true)
    }

    public init(sendBuffer: ChronoxorFbe.Buffer, receiveBuffer: ChronoxorFbe.Buffer) {
        ProtoSender = ChronoxorProto.FinalClient(sendBuffer: sendBuffer, receiveBuffer: receiveBuffer)
        ProtoReceiver = ChronoxorProto.FinalClient(sendBuffer: sendBuffer, receiveBuffer: receiveBuffer)
        OrderMessageSenderModel = OrderMessageFinalModel(buffer: sendBuffer)
        OrderMessageReceiverValue = ChronoxorProtoex.OrderMessage()
        OrderMessageReceiverModel = OrderMessageFinalModel()
        BalanceMessageSenderModel = BalanceMessageFinalModel(buffer: sendBuffer)
        BalanceMessageReceiverValue = ChronoxorProtoex.BalanceMessage()
        BalanceMessageReceiverModel = BalanceMessageFinalModel()
        AccountMessageSenderModel = AccountMessageFinalModel(buffer: sendBuffer)
        AccountMessageReceiverValue = ChronoxorProtoex.AccountMessage()
        AccountMessageReceiverModel = AccountMessageFinalModel()
        build(with: sendBuffer, receiveBuffer: receiveBuffer, final: true)
    }

    public func send(obj: Any) throws -> Int {
        return try send(obj: obj, listener: self as? ChronoxorFbe.LogListener)
    }

    public func send(obj: Any, listener: ChronoxorFbe.LogListener?) throws -> Int {
        switch obj {
            case is ChronoxorProtoex.OrderMessage: return try send(value: obj as! ChronoxorProtoex.OrderMessage, listener: listener)
            case is ChronoxorProtoex.BalanceMessage: return try send(value: obj as! ChronoxorProtoex.BalanceMessage, listener: listener)
            case is ChronoxorProtoex.AccountMessage: return try send(value: obj as! ChronoxorProtoex.AccountMessage, listener: listener)
            default: break
        }

        // Try to send using imported clients
        var result: Int = 0
        result = try ProtoSender.send(obj: obj, listener: listener)
        if result > 0 { return result }

        return 0
    }

    public func send(value: ChronoxorProtoex.OrderMessage) throws -> Int {
        return try send(value: value, listener: self as? ChronoxorFbe.LogListener)
    }

    public func send(value: ChronoxorProtoex.OrderMessage, listener: ChronoxorFbe.LogListener?) throws -> Int {
        // Serialize the value into the FBE stream
        let serialized = try OrderMessageSenderModel.serialize(value: value)
        assert(serialized > 0, "ChronoxorProtoex.OrderMessage serialization failed!")
        assert(OrderMessageSenderModel.verify(), "ChronoxorProtoex.OrderMessage validation failed!")

        // Log the value
        if logging {
            let message = value.description
            listener?.onSendLog(message: message)
        }

        // Send the serialized value
        return try sendSerialized(serialized: serialized)
    }

    public func send(value: ChronoxorProtoex.BalanceMessage) throws -> Int {
        return try send(value: value, listener: self as? ChronoxorFbe.LogListener)
    }

    public func send(value: ChronoxorProtoex.BalanceMessage, listener: ChronoxorFbe.LogListener?) throws -> Int {
        // Serialize the value into the FBE stream
        let serialized = try BalanceMessageSenderModel.serialize(value: value)
        assert(serialized > 0, "ChronoxorProtoex.BalanceMessage serialization failed!")
        assert(BalanceMessageSenderModel.verify(), "ChronoxorProtoex.BalanceMessage validation failed!")

        // Log the value
        if logging {
            let message = value.description
            listener?.onSendLog(message: message)
        }

        // Send the serialized value
        return try sendSerialized(serialized: serialized)
    }

    public func send(value: ChronoxorProtoex.AccountMessage) throws -> Int {
        return try send(value: value, listener: self as? ChronoxorFbe.LogListener)
    }

    public func send(value: ChronoxorProtoex.AccountMessage, listener: ChronoxorFbe.LogListener?) throws -> Int {
        // Serialize the value into the FBE stream
        let serialized = try AccountMessageSenderModel.serialize(value: value)
        assert(serialized > 0, "ChronoxorProtoex.AccountMessage serialization failed!")
        assert(AccountMessageSenderModel.verify(), "ChronoxorProtoex.AccountMessage validation failed!")

        // Log the value
        if logging {
            let message = value.description
            listener?.onSendLog(message: message)
        }

        // Send the serialized value
        return try sendSerialized(serialized: serialized)
    }

    // Send message handler
    open func onSend(buffer: Data, offset: Int, size: Int) throws -> Int { throw NSError() }
    open func onReceive(type: Int, buffer: Data, offset: Int, size: Int) -> Bool {
        return onReceiveListener(listener: self as! FinalReceiverListener, type: type, buffer: buffer, offset: offset, size: size)
    }

    open func onReceiveListener(listener: FinalReceiverListener, type: Int, buffer: Data, offset: Int, size: Int) -> Bool {
        switch type {
        case ChronoxorProtoex.OrderMessageFinalModel.fbeTypeConst:
            // Deserialize the value from the FBE stream
            OrderMessageReceiverModel.attach(buffer: buffer, offset: offset)
            assert(OrderMessageReceiverModel.verify(), "Protoex.OrderMessage validation failed!")
            let deserialized = OrderMessageReceiverModel.deserialize(value: &OrderMessageReceiverValue)
            assert(deserialized > 0, "Protoex.OrderMessage deserialization failed!")

            // Log the value
            if logging {
                let message = OrderMessageReceiverValue.description
                listener.onReceiveLog(message: message)
            }

            // Call receive handler with deserialized value
            listener.onReceive(value: OrderMessageReceiverValue)
            return true
        case ChronoxorProtoex.BalanceMessageFinalModel.fbeTypeConst:
            // Deserialize the value from the FBE stream
            BalanceMessageReceiverModel.attach(buffer: buffer, offset: offset)
            assert(BalanceMessageReceiverModel.verify(), "Protoex.BalanceMessage validation failed!")
            let deserialized = BalanceMessageReceiverModel.deserialize(value: &BalanceMessageReceiverValue)
            assert(deserialized > 0, "Protoex.BalanceMessage deserialization failed!")

            // Log the value
            if logging {
                let message = BalanceMessageReceiverValue.description
                listener.onReceiveLog(message: message)
            }

            // Call receive handler with deserialized value
            listener.onReceive(value: BalanceMessageReceiverValue)
            return true
        case ChronoxorProtoex.AccountMessageFinalModel.fbeTypeConst:
            // Deserialize the value from the FBE stream
            AccountMessageReceiverModel.attach(buffer: buffer, offset: offset)
            assert(AccountMessageReceiverModel.verify(), "Protoex.AccountMessage validation failed!")
            let deserialized = AccountMessageReceiverModel.deserialize(value: &AccountMessageReceiverValue)
            assert(deserialized > 0, "Protoex.AccountMessage deserialization failed!")

            // Log the value
            if logging {
                let message = AccountMessageReceiverValue.description
                listener.onReceiveLog(message: message)
            }

            // Call receive handler with deserialized value
            listener.onReceive(value: AccountMessageReceiverValue)
            return true
        default: break
        }

        if let ProtoReceiver = ProtoReceiver, ProtoReceiver.onReceiveListener(listener: listener, type: type, buffer: buffer, offset: offset, size: size) {
            return true
        }

        return false
    }
}
