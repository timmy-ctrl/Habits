import UIKit

final class BillboardViewHomePageView: UIView {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textUppercased(text: "Пока ты держишься за свою «стабильность», кто-то рядом воплощает в жизнь твои мечты.")
        titleLabel.textColor = UIColor.lilacColor
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        return titleLabel
    }()
    
    private let authorLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textUppercased(text: " - Роберт Орбен")
        titleLabel.textColor = UIColor.lilacColor
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        return titleLabel
    }()
    
    private let billboardImage: UIImageView = {
        let billboardImage = UIImageView()
        billboardImage.image = AssetImages.billboardImage.image
        return billboardImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBillboardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBillboardView() {
        configureBillboardImage()
        congifureTitleLabel()
        configureaAppereanceBillboardView()
    }
}

//MARK: - Setup UI
extension BillboardViewHomePageView {
    private func configureBillboardImage() {
        self.addSubviews(billboardImage)
        NSLayoutConstraint.activate([
            billboardImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            billboardImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
  
        ])
    }
    private func configureaAppereanceBillboardView() {
        self.layer.cornerRadius = 16
        backgroundColor = UIColor.whiteColor
    }
    private func congifureTitleLabel() {
        self.addSubviews(titleLabel, authorLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(equalToConstant: 170),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        ])
    }
}
