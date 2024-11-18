import UIKit

final class BillboardViewHomePageView: UIView {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textUppercased(text: "We first make our habits, and then our habits make us.")
        titleLabel.textColor = UIColor.customColor
        titleLabel.numberOfLines = 0
        titleLabel.middleFont()
        return titleLabel
    }()
    
    private let billboardImage: UIImageView = {
        let billboardImage = UIImageView()
        billboardImage.image = AssetImages.billboardImage.image
        return billboardImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBillboardImage()
        congifureTitleLabel()
        configureBillboardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    private func configureBillboardView() {
        self.layer.cornerRadius = 16
        backgroundColor = UIColor.whiteColor
    }
    private func congifureTitleLabel() {
        self.addSubviews(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(equalToConstant: 180),
        ])
    }
}
