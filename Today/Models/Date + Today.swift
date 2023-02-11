//
//  Date + Today.swift
//  Today
//
//  Created by Aleksei on 26.01.2023.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        
        if  Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString(
                "Today at %@",
                comment: "Today at time format string")
            
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimerFormat = NSLocalizedString(
                "%@ at %@",
                comment: "Date and time format string")
            
            return String(format: dateAndTimerFormat, dateText)
        }
    }
    
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
           return NSLocalizedString("Today", comment: "Today due date desctiption")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
