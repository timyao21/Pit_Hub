//
//  DateUtils.swift
//  Pit Hub
//
//  Created by Junyu Yao on 12/9/24.
//

import Foundation

struct DateUtils {
    static func getCurrentDate() -> Date {
        return Date()
    }
    
    static func formatDate(_ date: Date, dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .none) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: date)
    }
    
    static func formatDateString(_ dateString: String) -> String? {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            dateFormatter.timeZone = .current
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    static func formatDateTimeString(_ dateString: String) -> String? {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
            dateFormatter.timeZone = .current
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    // MARK: - format the ISO8601 Data Format to local time
    static func formatLocalFullDateString(_ dateString: String, dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .none) -> String? {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = dateStyle
            dateFormatter.timeStyle = timeStyle
            dateFormatter.timeZone = .current
            dateFormatter.locale = Locale(identifier: "zh_CN")
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    static func formatLocalDateString(_ dateString: String) -> String? {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M月d日 HH:mm"// Format for month and day
            dateFormatter.timeZone = .current
            dateFormatter.locale = Locale(identifier: "zh_CN") // Change this for different locales if needed
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    static func getWeekday(from dateString: String) -> String? {
        // Step 1: Convert the ISO8601 date string to a Date object
        let isoFormatter = ISO8601DateFormatter()
        guard let date = isoFormatter.date(from: dateString) else {
            return nil
        }
        
        // Step 2: Use DateFormatter to get the weekday from the Date object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // EEEE gives the full name of the weekday (e.g., Monday)
        dateFormatter.timeZone = .current // Adopts the current device's time zone
        dateFormatter.locale = Locale(identifier: "zh_CN") // Sets the locale to Chinese
        let weekday = dateFormatter.string(from: date)
        
        return weekday
    }
    
}
