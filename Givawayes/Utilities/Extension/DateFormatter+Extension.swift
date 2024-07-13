//
//  DateFormatter+Extension.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import Foundation
extension DateFormatter {
    static func convertDateFormat(dateStr: String) -> String? {
          let dateFormatter = DateFormatter()
          

          dateFormatter.dateFormat = Constants.dateFormatterFrom.rawValue
          dateFormatter.locale = Locale(identifier: "en")
          
          guard let date = dateFormatter.date(from: dateStr) else { return nil }
          
          dateFormatter.dateFormat = Constants.dateFormatterTo.rawValue
          return dateFormatter.string(from: date)
      }
}
