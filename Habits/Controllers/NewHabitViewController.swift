import UIKit

final class NewHabitViewController: UIViewController {
    
    private var habitFrequencyViewModel: HabitFrequencyModel
    
    private var newHabitView: NewHabitView? {
        view as? NewHabitView
    }
    
    init(habitFrequencyViewModel: HabitFrequencyModel) {
        self.habitFrequencyViewModel = habitFrequencyViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRemindView()
        addTapGestureHabitFrequencyView()
        configureNewHabitViewController()
    }
    
    override func loadView() {
        let newHabitView = NewHabitView(frame: .zero, habitFrequencyViewModel: habitFrequencyViewModel)
        self.view = newHabitView
    }
}

//MARK: - Setup RemindViewController
extension NewHabitViewController {
    private func addTapGestureRemindView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(reminderViewTapped))
        newHabitView?.reminderView.addGestureRecognizer(tapGesture)
        newHabitView?.reminderView.isUserInteractionEnabled = true
    }
    
    @objc private func reminderViewTapped() {
        let remindVC = ReminderViewController()
        if let sheet = remindVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        present(remindVC, animated: true, completion: nil)
    }
}

//MARK: - Setup AnalyticsHabitViewController Navigation
extension NewHabitViewController {
    private func addTapGestureHabitFrequencyView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(habitFrequencyViewTapped))
        newHabitView?.habitFrequencyView.addGestureRecognizer(tapGesture)
        newHabitView?.habitFrequencyView.isUserInteractionEnabled = true
    }
    @objc private func habitFrequencyViewTapped() {
        let analyticsHabitVC = AnalyticsHabitViewController()
        navigationController?.pushViewController(analyticsHabitVC, animated: true)
    }
}

//MARK: - UIViewControllerTransitioningDelegate
extension NewHabitViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfScreenPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

//MARK: - Setup UI
extension NewHabitViewController {
    private func configureNewHabitViewController() {
        configureBackButton()
        configureTitleVC()
    }
    private func configureTitleVC() {
        title = "New Habit"
    }
    private func configureBackButton() {
        navigationItem.hidesBackButton = true
        let backButtonItem = UIBarButtonItem(customView: newHabitView?.backButton ?? UIButton())
        navigationItem.leftBarButtonItem = backButtonItem
        newHabitView?.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
}

//MARK: - Action button
extension NewHabitViewController {
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
