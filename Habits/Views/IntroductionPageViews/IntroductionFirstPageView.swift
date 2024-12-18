import UIKit

final class IntroductionFirstPageView: UIView {
    
    private lazy var introductionPageStackView: UIStackView = {
        introductionPageStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                   mainImageView,           descriptionLabel])
        introductionPageStackView.distribution = .equalCentering
        introductionPageStackView.alignment = .center
        introductionPageStackView.axis = .vertical
        return introductionPageStackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.introductionFontBold(text: "Добро пожаловать в Welcome to monumental habits")
        titleLabel.textColor = UIColor.lilacColor
        titleLabel.alignmentCenter()
        return titleLabel
    }()
    
    private let mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.image = AssetImages.Introductionimg1.image
        mainImageView.contentMode = .scaleAspectFit
        return mainImageView
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        let attributedText = NSMutableAttributedString(
            string: "Ваша дорога к лучшей версии себя начинается здесь. Создавайте и следите за своими привычками, чтобы сделать каждый день продуктивнее и счастливее.",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.lilacColor]
        )
        if let rangeHelpYou = attributedText.string.range(of: "привычками") {
                   let nsRangeHelpYou = NSRange(rangeHelpYou, in: attributedText.string)
            attributedText.addAttribute(.foregroundColor, value: UIColor.lightOrangeColor, range: nsRangeHelpYou)
               }
        if let rangeYourself = attributedText.string.range(of: "продуктивнее и счастливее") {
                    let nsRangeYourself = NSRange(rangeYourself, in: attributedText.string)
                    attributedText.addAttribute(.foregroundColor, value: UIColor.lightOrangeColor, range: nsRangeYourself)
                }
        descriptionLabel.attributedText = attributedText
        descriptionLabel.alignmentCenter()
        return descriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureIntroductionPageStackView()
        congfigureIntroductionPageOneView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension IntroductionFirstPageView {
    private func congfigureIntroductionPageOneView() {
        self.backgroundColor = UIColor.systemBackground
    }
    private func configureIntroductionPageStackView() {
        self.addSubviews(introductionPageStackView)
        NSLayoutConstraint.activate([
            introductionPageStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            introductionPageStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            introductionPageStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            introductionPageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 350),
            mainImageView.heightAnchor.constraint(equalToConstant: 420)
        ])
    }
}
