//
//  String+Extension.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import Foundation

extension String {
    func GivawayesFormattedDate() -> String {
        
        guard let date = DateFormatter.convertDateFormat(dateStr: self) else {
            return ""
        }
        return date
    }
}




