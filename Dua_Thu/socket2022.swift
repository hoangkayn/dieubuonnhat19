//
//  socket2022.swift
//  App_Dua_Thu
//
//  Created by Nguyễn Khánh Hoàng on 30/08/2022.
//
import Foundation
import SocketIO
class Socket2022: NSObject{
static let shareInstance = Socket2022()
    let socket = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    var clientSocket:SocketIOClient!
    override init(){
        super.init()
        clientSocket = socket.defaultSocket
    }
    func getSocketInfo()->SocketIOClient{
        return clientSocket
    }
    func connectSocketServer(){
        clientSocket.connect()
    }
    func disconnectSocketServer(){
        clientSocket.disconnect()
    }
}
