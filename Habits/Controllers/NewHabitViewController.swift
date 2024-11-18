import UIKit

class NewHabitViewController: UIViewController {
    
    private var newHabitView: NewHabitView? {
        view as? NewHabitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRemindView()
        configureTitleVC()
    }
    
    override func loadView() {
        super.loadView()
        self.view = NewHabitView()
    }
    
    private func configureTitleVC() {
        title = "New Habit"
    }
}

//MARK: - Setup RemindVC

extension NewHabitViewController {
    private func addTapGestureRemindView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(remindViewTapped))
        newHabitView?.reminderView.addGestureRecognizer(tapGesture)
        newHabitView?.reminderView.isUserInteractionEnabled = true
    }
    @objc private func remindViewTapped() {
        let remindVC = ReminderViewController()
        navigationController?.pushViewController(remindVC, animated: true)
    }
}
