//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Diego Freniche Brito on 30/04/2018.
//  Copyright © 2018 Diego Freniche Brito. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func viewDidLoad() {
        print("Reading something")

    }
    
    func read() {
        
        PRKeychainHelper().testK()
        
        let domain: String!

        if self.textView.text.isEmpty {
            domain = "group.test.projects"
        } else {
            domain = self.textView.text
        }
        let login = "mypassword"
        let keychainQuery: [NSString: NSObject] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: login as NSObject,
            kSecAttrService: domain as NSObject,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne]
        var rawResult: AnyObject?
        let keychain_get_status: OSStatus = SecItemCopyMatching(keychainQuery as CFDictionary, &rawResult)
        
        self.textView.text = "Reading something"
        
        if (keychain_get_status == errSecSuccess) {
            if let retrievedData = rawResult as? Data,
                let password = String(data: retrievedData, encoding: String.Encoding.utf8) {
                // "password" contains the password string now
                self.textView.text = password
                
            }
        } else {
            self.textView.text = "Error"
        }
    }
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        print("Reading something")

        read()
        
        
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
