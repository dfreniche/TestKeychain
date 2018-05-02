//
//  PRKeychainHelper.swift
//  Projects
//
//  Created by Cillian O'Keeffe on 22/06/2015.
//
//

import Foundation

class PRKeychainHelper: NSObject, APSKeychainWrapperDelegate {
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didSaveValueWithResult result: [AnyHashable : Any]!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didSaveValueWithError error: Error!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didUpdateValueWithResult result: [AnyHashable : Any]!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didUpdateValueWithError error: Error!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didReadValueWithResult result: [AnyHashable : Any]!) {
        print(result)
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didReadValueWithError error: Error!) {
        print("Error")
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didDeleteValueWithResult result: [AnyHashable : Any]!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didDeleteValueWithError error: Error!) {
        
    }
    
    static let kGROUP = "group.test.projects"
    static let kSERVICE = "keychain.test.projects"
    
    
    let service: String!
    let group: String!
    
    override convenience init() {
        self.init(group: PRKeychainHelper.kGROUP, service: PRKeychainHelper.kSERVICE)
    }
    
    init(group: String, service: String) {
        self.group = group
        self.service = service
    }
    
    func testK() {
        let k = APSKeychainWrapper(identifier: "mypassword", service: self.service, accessGroup: self.group)
        k?.read()
        
    }
}
