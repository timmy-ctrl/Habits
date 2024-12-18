import UIKit

extension IntroductionPageViewController {
    public func configureIntroductionPageViewController() {
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(getStartedButton)
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            skipButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            nextButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

