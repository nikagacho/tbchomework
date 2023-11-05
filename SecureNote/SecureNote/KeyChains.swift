//
//  KeyChains.swift
//  SecureNote
//
//  Created by Nikoloz Gachechiladze on 05.11.23.
//

import UIKit
import Security

class KeyChainManager {
    
    static func savePassword(service: String, account: String, password: String) -> Bool {
        guard let passwordData = password.data(using: .utf8) else {
            return false
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    static func getPassword(service: String, account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue!
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess, let passwordData = item as? Data, let password = String(data: passwordData, encoding: .utf8) {
            return password
        } else {
            return nil
        }
    }
}



