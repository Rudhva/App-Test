//
//  ViewController.swift
//  App Test
//
//  Created by Rudhva Patel on 6/25/23.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchAllContacts() {
        
        //get access to contacts store
        let store = CNContactStore()
        
        //specify which data keys we want to fetch
        let keys = {CNContactGivenNameKey, CNContactPhoneNumbersKey} as [CNKeyDescriptor]
        
        //Create fetch request
        let fetchRequest = CNContactFetchRequest(keysToFetch: <#T##[CNKeyDescriptor]#>)
        
        //call method to fetch all contacts
        do {
        try store.enumerateContacts(with: <#T##CNContactFetchRequest#>, usingBlock: <#T##(CNContact, UnsafeMutablePointer<ObjCBool>) -> Void#>)
        }
        catch {
            //if there is an error, handle it here
        }
        
        
    }


}

