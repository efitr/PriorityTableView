//
//  Date+Extension.swift
//  PriorityTableView
//
//  Created by Elmer Astudillo on 5/10/19.
//  Copyright © 2019 App Solutions. All rights reserved.
//

import Foundation

extension Date
{
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}
