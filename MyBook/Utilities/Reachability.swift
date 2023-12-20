//
//  Reachability.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import Foundation
import Reachability
import SwiftMessages

protocol ReachabilityProtocol {
    var showBackGroundView: ((Bool) -> Void) { get set }
    func checkConnection()
}

final class ConnectionManger: ReachabilityProtocol {
    var showBackGroundView: ((Bool) -> Void) = {_ in }
    private var reachability: Reachability?
    private let swiftMessage = SwiftMessage()
    static let shared = ConnectionManger()
    
    private init() {
        do {
            reachability = try Reachability()
        }catch {
            
        }
    }
    
    func checkConnection() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability?.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }


    
    @objc private func reachabilityChanged(note: Notification) {

      let reachability = note.object as! Reachability

      switch reachability.connection {
      case .wifi:
          print("Reachable via WiFi")
          showBackGroundView(true)
      case .cellular:
          print("Reachable via Cellular")
          showBackGroundView(true)

      case .unavailable:
        print("Network not reachable")
          showBackGroundView(false)

      }
    }
    
    func deInitObserve() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
}
