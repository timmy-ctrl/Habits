import UIKit

final class CalendarDataSource {
    private let calendar = Calendar.current
    private var days: [CalendarDay] = []
    
    init (month: Date) {
        generateDays(for: month)
    }
    
    func generateDays(for month: Date) {
        days.removeAll()
        
        guard let range = calendar.range(of: .day, in: .month, for: month) else { return }
        let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        
        for day in range {
            let date = calendar.date(byAdding: .day, value: day - 1, to: firstDay)!
            days.append(CalendarDay(date: date, isHighlighted: day % 3 == 0, hasIcon: day % 5 == 0))
        }
    }
    
    func day(at index: Int) -> CalendarDay? {
          guard index < days.count else { return nil }
          return days[index]
      }

      func numberOfDays() -> Int {
          return days.count
      }
}
