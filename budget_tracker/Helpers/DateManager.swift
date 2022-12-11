import SwiftUI;

public class DateHelper {
    private static let dateFormatter = DateFormatter();
    
    static func stringToDate(date: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        dateFormatter.dateFormat = format;
        print("date: \(date)")
        return dateFormatter.date(from: date) ?? Date();
    }
    
    static func dateToString(date: Date, format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        dateFormatter.dateFormat = format;
        return dateFormatter.string(from: date);
    }
}
