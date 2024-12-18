import UIKit

final class HomePageViewController: UIViewController {

    private var homePageView: HomePageView? {
        view as? HomePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionOnNewHabitViewController()
        setTitleViewController()
    }
    
    override func loadView() {
        super.loadView()
        self.view = HomePageView()
    }
    
    private func transitionOnNewHabitViewController() {
        homePageView?.addHabbitButton.addTarget(self, action: #selector(didTappedAddHabbitButton), for: .touchUpInside)
    }
}

//MARK: - Action Buttons
extension HomePageViewController {
   @objc private func didTappedAddHabbitButton() {
       let habitFrequencyViewModel = HabitFrequencyModel()
       let newHabbitVC = NewHabitViewController(habitFrequencyViewModel: habitFrequencyViewModel)
        navigationController?.pushViewController(newHabbitVC, animated: true)
    }
}

//MARK: - Setup UI
extension HomePageViewController {
    private func setTitleViewController() {
        title = "Homepage"
    }
}


