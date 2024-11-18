import UIKit

final class ReminderViewController: UIViewController {
    
//    private var reminderView: ReminderView? {
//        view as? ReminderView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func loadView() {
        super.loadView()
//        self.view = ReminderView()
    }
}
