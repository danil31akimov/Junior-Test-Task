//
//  String + Ext.swift
//  Junior-Test-Task
//
//  Created by Данил Акимов on 15.03.2023.
//

import Foundation

extension String {
    
    func isValid() -> Bool  {
        
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
        
    }
}
