import UIKit

final class LoginButtonsView: UIView {
    
    private var buttonsStuckView: UIStackView = {
        let buttonsStuckView = UIStackView()
        return buttonsStuckView
    }()
    
    private let googleButton: UIButton = {
        let googleButton = UIButton()
        googleButton.backgroundColor = UIColor.white
        googleButton.setTitle("Continue with Google", for: .normal)
        googleButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        googleButton.setTitleColor(UIColor.customColor, for: .normal)
        googleButton.setImage(AssetImages.google.image, for: .normal)
        googleButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: -50, bottom: 0, right: 0)
        googleButton.layer.cornerRadius = 10
        return googleButton
    }()
    
    private let facebookButton: UIButton = {
        var facebookButton = UIButton()
        facebookButton.backgroundColor = UIColor.white
        facebookButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: -30, bottom: 0, right: 0)
        facebookButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        facebookButton.setTitle("Continue with Facebook", for: .normal)
        facebookButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        facebookButton.setTitleColor(UIColor.customColor, for: .normal)
        facebookButton.setImage(AssetImages.facebook.image, for: .normal)
        facebookButton.layer.cornerRadius = 10
        return facebookButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonsStuckView()
        configureButtonsStuckView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButtonsStuckView() {
        buttonsStuckView = UIStackView(arrangedSubviews: [googleButton,
                                                          facebookButton])
        buttonsStuckView.distribution = .fillEqually
        buttonsStuckView.spacing = 9
        buttonsStuckView.axis = .vertical
    }
}

//MARK: - SETUP UI
extension LoginButtonsView {
    private func configureButtonsStuckView() {
        self.addSubviews(buttonsStuckView)
        NSLayoutConstraint.activate([
            buttonsStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonsStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            buttonsStuckView.heightAnchor.constraint(equalToConstant: 105)
        ])
    }
}
