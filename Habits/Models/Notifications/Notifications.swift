import UIKit
import UserNotifications

final class Notifications {
    
    init() {
        checkForPermission()
    }
    
    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.displayNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.displayNotification()
                    }
                }
            default:
                return
            }
        }
        
    }
    
    func displayNotification() {
        let identifer = "morning"
        let title = "Time to work out!"
        let body = "Dont be a slacker!"
        let hour  = 11
        let minute = 53
        let isDally = true
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponets = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponets.hour = hour
        dateComponets.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponets, repeats: isDally)
        let request = UNNotificationRequest(identifier: identifer, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifer])
        notificationCenter.add(request)
                                           
    }
}
