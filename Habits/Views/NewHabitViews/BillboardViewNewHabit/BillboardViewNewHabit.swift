import UIKit

final class BillboardViewNewHabitView: UIView {
    
    private var  billboardViewNewHabitStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textUppercased(text: "Start this habit")
        titleLabel.textColor = UIColor.customColor
        titleLabel.alignmentCenter()
        titleLabel.font = .systemFont(ofSize: 23, weight: .bold)
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textUppercased(text: "ullamco laboris nisi ut aliquip ex ea commodo consequat dolore. ")
        descriptionLabel.numberOfLines = 5
        descriptionLabel.textColor = UIColor.textFieldColor
        descriptionLabel.alignmentCenter()
        descriptionLabel.smallFont()
        return descriptionLabel
    }()
    
    private let completeHabitImageView: UIImageView = {
        let completeHabitButton = UIImageView()
        completeHabitButton.image = AssetImages.arrow.image
        return completeHabitButton
    }()
    
    private let faceBilboardImageView: UIImageView = {
        let completeHabitButton = UIImageView()
        completeHabitButton.image = AssetImages.facebillboard.image
        return completeHabitButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBillboardView()
        configureFaceBilboardImageView()
        configureBillboardViewNewHabitStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI

extension BillboardViewNewHabitView {
    private func configureBillboardView() {
        self.layer.cornerRadius = 16
        backgroundColor = UIColor.whiteColor
    }
    private func configureBillboardViewNewHabitStackView() {
        billboardViewNewHabitStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                        descriptionLabel,
                                                                        completeHabitImageView])
        billboardViewNewHabitStackView.distribution = .equalCentering
        billboardViewNewHabitStackView.spacing = 15
        billboardViewNewHabitStackView.alignment = .center
        billboardViewNewHabitStackView.axis = .vertical
        
        self.addSubviews(billboardViewNewHabitStackView)
        NSLayoutConstraint.activate([
            billboardViewNewHabitStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            billboardViewNewHabitStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            billboardViewNewHabitStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
               completeHabitImageView.widthAnchor.constraint(equalToConstant: 20),
               completeHabitImageView.heightAnchor.constraint(equalToConstant: 25)
           ])
    }
    private func configureFaceBilboardImageView() {
        self.addSubviews(faceBilboardImageView)
        NSLayoutConstraint.activate([
            faceBilboardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            faceBilboardImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -40)
        ])
    }
}
