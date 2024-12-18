import UIKit

final class AnalyticsHabitViewController: UIViewController {
        
    private var analyticsView: AnalyticsView? {
        view as? AnalyticsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitleViewController()
        configureBackButton()
    }
    
    override func loadView() {
        super.loadView()
        self.view = AnalyticsView()
    }
    
    private func configureTitleViewController() {
        title = "Read a Book"
    }
    
    private func configureBackButton() {
        navigationItem.hidesBackButton = true
        let backButtonItem = UIBarButtonItem(customView: analyticsView?.backButton ?? UIButton())
        navigationItem.leftBarButtonItem = backButtonItem
        analyticsView?.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

