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
        Task.init {
            await fetchAllContacts()
        }
    }
    
    
    
    func fetchAllContacts() async {
        
        //get access to contacts store
        let store = CNContactStore()
        
        //specify which data keys we want to fetch
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        
        //Create fetch request
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        //call method to fetch all contacts
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                //do something with the contact
                
                print(contact.givenName)
                for number in contact.phoneNumbers {
                    
                    switch number.label {
                        case CNLabelPhoneNumberMobile:
                            print("- Mobile: \(number.value.stringValue)")
                        case CNLabelPhoneNumberMain:
                            print("- Main: \(number.value.stringValue)")
                        default:
                            print("-Other: \(number.value.stringValue)")
                    }
                    
                }
            })
        }
        catch {
            //if there is an error, handle it here
            print("error")
        }
        
        
    }


}

