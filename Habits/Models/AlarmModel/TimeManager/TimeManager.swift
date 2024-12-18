import UIKit

final class TimeManager {
    func generateTimes() -> [TimeModel] {
        var times: [TimeModel] = []
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.hour = 6
        dateComponents.minute = 0
        
        for _ in 0..<12 {
            if let date = calendar.date(from: dateComponents) {
                let formatter = DateFormatter()
                formatter.dateFormat = "hh:mm a"
                let timeString = formatter.string(from: date)
                times.append(TimeModel(timeString: timeString))
                dateComponents.minute! += 30
            }
        }
        return times
    }
}
