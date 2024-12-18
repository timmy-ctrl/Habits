import UIKit

final class IntroductionPageViewController: UIPageViewController {
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(UIColor.lilacColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = UIColor.lilacColor
        control.pageIndicatorTintColor = UIColor.lightOrange
        control.numberOfPages = 4
        control.currentPage = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Пропустить", for: .normal)
        button.setTitleColor(UIColor.lilacColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать", for: .normal)
        button.backgroundColor = UIColor.orangeColor
        button.setTitleColor(UIColor.lilacColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    var pages: [UIViewController] = {
        return [
            IntroductionFirstPageViewController(),
            IntroductionSecondPageViewController(),
            IntroductionThirdPageViewController(),
            IntroductionFourthPageViewController()
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIntroductionPageViewController()
        setDelegates()
        setFirstPage()
        actionsButtons()
    }
    
    private func setDelegates() {
        self.dataSource = self
        self.delegate = self
    }
    private func setFirstPage() {
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
    
    private func navigateToHomePage() {
        let homePageViewController = HomePageViewController()
        navigationController?.setViewControllers([homePageViewController], animated: true)
    }
    
    public func updateButtonsVisibility(for index: Int) {
        let isLastPage = index == pages.count - 1
        nextButton.isHidden = isLastPage
        skipButton.isHidden = isLastPage
        pageControl.isHidden = isLastPage
        getStartedButton.isHidden = !isLastPage
    }
    
    private func actionsButtons() {
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        getStartedButton.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
    }
}

//MARK: - Actions buttons
extension IntroductionPageViewController {
    @objc public func didTapNextButton() {
        guard let currentViewController = viewControllers?.first,
              let currentIndex = pages.firstIndex(of: currentViewController),
              currentIndex < pages.count - 1 else { return }
        
        let nextPage = pages[currentIndex + 1]
        setViewControllers([nextPage], direction: .forward, animated: true)
        pageControl.currentPage = currentIndex + 1
        updateButtonsVisibility(for: currentIndex + 1)
    }
    @objc public func didTapSkipButton() {
        navigateToHomePage()
    }
    
    @objc public func didTapGetStartedButton() {
        navigateToHomePage()
    }
    
    @objc public func didTapSkipsButton() {
        let homePageViewController = HomePageViewController()
        navigationController?.setViewControllers([homePageViewController], animated: true)
    }
}



