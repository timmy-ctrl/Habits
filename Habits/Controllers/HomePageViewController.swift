import UIKit

final class HomePageViewController: UIViewController {
    
    private var homePageView: HomePageView? {
        view as? HomePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionOnNewHabbitViewController()
        setTitleViewController()
    }
    
    override func loadView() {
        super.loadView()
        self.view = HomePageView()
    }
    
    private func transitionOnNewHabbitViewController() {
        homePageView?.addHabbitButton.addTarget(self, action: #selector(didTappedAddHabbitButton), for: .touchUpInside)
    }
    
    private func setTitleViewController() {
        title = "Homepage"
    }
}

//MARK: - Action Buttons
extension HomePageViewController {
   @objc private func didTappedAddHabbitButton() {
        let newHabbitVC = NewHabitViewController()
        navigationController?.pushViewController(newHabbitVC, animated: true)
    }
}
