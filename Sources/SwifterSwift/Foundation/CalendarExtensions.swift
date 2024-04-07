// CalendarExtensions.swift - Copyright 2024 SwifterSwift

#if canImport(Foundation)
import Foundation

// MARK: - Methods

public extension Calendar {
    /// SwifterSwift: Return the number of days in the month for a specified 'Date'.
    ///
    ///		let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///		Calendar.current.numberOfDaysInMonth(for: date) -> 31
    ///
    /// - Parameter date: the date form which the number of days in month is calculated.
    /// - Returns: The number of days in the month of 'Date'.
    func numberOfDaysInMonth(for date: Date) -> Int {
        return range(of: .day, in: .month, for: date)!.count
    }
    
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)

        return numberOfDays.day ?? 0
    }

    func add(numberOfDays: Int, to date: Date) -> Date? {
        return self.date(byAdding: .day, value: numberOfDays, to: date)
    }
}

#endif
