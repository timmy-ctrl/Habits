import UIKit

final class ReminderViewController: UIViewController {
    
    private var reminderView: AlarmView? {
        view as? AlarmView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = AlarmView()
    }
}


