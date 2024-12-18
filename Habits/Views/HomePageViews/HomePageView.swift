import UIKit

final class HomePageView: UIView {
    
    private var isAnimate = false
        
    private let backgroundImageView: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = AssetImages.homePageBackground.image
        return backgroundImage
    }()
    
    private let titleHomePageCalendarLabel: UILabel = {
        let titleHomePageCalendarLabel = UILabel()
        titleHomePageCalendarLabel.textUppercased(text: "Habits")
        titleHomePageCalendarLabel.middleFont()
        titleHomePageCalendarLabel.textColor = UIColor.lilacColor
        return titleHomePageCalendarLabel
    }()
    
    public let addHabbitButton: UIButton = {
        let addHabbitButton = UIButton()
        addHabbitButton.setImage(AssetImages.plus.image, for: .normal)
        addHabbitButton.backgroundColor = UIColor.orangeColor
        addHabbitButton.layer.cornerRadius = 25
        return addHabbitButton
    }()
    
    private let billboardView = BillboardViewHomePageView()
    private let homePageCalendarCollectionView = HomePageCalendarСollectionView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHomePageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHomePageView() {
        congifureBackgroundImage()
        configureBillboardView()
        configureTitleHomePageCalendarLabel()
        startShadowPulseAnumation()
        configireHomePageCalendarViewController()
        configureAddHabbitButton()
        configureBackgroundColor()
    }
}

//MARK: - Setup UI
extension HomePageView {
    private func configireHomePageCalendarViewController() {
        homePageCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(homePageCalendarCollectionView)
        NSLayoutConstraint.activate([
            homePageCalendarCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 165),
            homePageCalendarCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            homePageCalendarCollectionView.topAnchor.constraint(equalTo: billboardView.bottomAnchor, constant: 30),
            homePageCalendarCollectionView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    private func configureAddHabbitButton() {
        self.addSubviews(addHabbitButton)
        NSLayoutConstraint.activate([
            addHabbitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addHabbitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addHabbitButton.widthAnchor.constraint(equalToConstant: 60),
            addHabbitButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    private func congifureBackgroundImage() {
        self.addSubviews(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    private func configureBackgroundColor() {
        self.backgroundColor = UIColor.lightBeigeColor
    }
    private func configureBillboardView() {
        self.addSubviews(billboardView)
        NSLayoutConstraint.activate([
            billboardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            billboardView.heightAnchor.constraint(equalToConstant: 180),
            billboardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            billboardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    private func configureTitleHomePageCalendarLabel() {
        self.addSubviews(titleHomePageCalendarLabel)
        NSLayoutConstraint.activate([
            titleHomePageCalendarLabel.topAnchor.constraint(equalTo: billboardView.bottomAnchor, constant: 56),
            titleHomePageCalendarLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        ])
    }
}

//MARK: - Animation Button
extension HomePageView {
    private func startShadowPulseAnumation() {
        addHabbitButton.layer.shadowColor = UIColor.orangeColor.cgColor
        addHabbitButton.layer.shadowOffset = .zero
        addHabbitButton.layer.shadowOpacity = 0.7
        
        let animation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = 20
        animation.toValue = 30
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        addHabbitButton.layer.add(animation, forKey: "shadowRadius")
    }
}
