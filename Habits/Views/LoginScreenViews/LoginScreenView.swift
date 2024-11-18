import UIKit

final class LoginScreenView: UIView {
    
    private let loginButtonsView = LoginButtonsView()
    
    private let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = AssetImages.background.image
        return backgroundImageView
    }()
    
    private let loupeButton: UIButton = {
        let loupeButton = UIButton()
        loupeButton.setImage(AssetImages.loupe.image, for: .normal)
        loupeButton.backgroundColor = UIColor(red: 233/255, green: 192/255, blue: 213/255, alpha: 1.0)
        loupeButton.layer.cornerRadius = 20
        return loupeButton
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textUppercased(text: "Welcome to monumental habits")
        titleLabel.bigFont()
        titleLabel.textColor = UIColor.customColor
        titleLabel.alignmentCenter()
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBackgroundImageView()
        configureLoupeButton()
        configureTitleLabel()
        configureLoginButtonView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI

extension LoginScreenView {
    
    private func configureLoginButtonView() {
        self.addSubviews(loginButtonsView)
        NSLayoutConstraint.activate([
            loginButtonsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            loginButtonsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            loginButtonsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
        ])
    }
    
    private func configureTitleLabel() {
        self.addSubviews(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            titleLabel.widthAnchor.constraint(equalToConstant: 350)
        ])
    }

    private func configureLoupeButton() {
        self.addSubviews(loupeButton)
        NSLayoutConstraint.activate([
            loupeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20),
            loupeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            loupeButton.widthAnchor.constraint(equalToConstant: 44),
            loupeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureBackgroundImageView() {
        self.addSubviews(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

