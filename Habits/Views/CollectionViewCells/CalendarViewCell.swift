import UIKit

final class CalendarViewCell: UICollectionViewCell {
    
    static let identify = "CalendarCell"
    
    private lazy var habitFrequencytackStuckView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dayLabel, habitImageView])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private var dayLabel: UILabel = {
        let label = UILabel()
        label.smallFont()
        label.textColor = UIColor.lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var habitImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureText(day: String ) {
        dayLabel.text = day
    }
    
    func configureImage(image: UIImage) {
        habitImageView.image = image
    }
}

//MARK: - Setup UI
extension CalendarViewCell {
    private func configureStackView() {
        contentView.addSubviews(habitFrequencytackStuckView)
        NSLayoutConstraint.activate([
            habitFrequencytackStuckView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            habitFrequencytackStuckView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            habitFrequencytackStuckView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
//        NSLayoutConstraint.activate([
//            habitImageView.widthAnchor.constraint(equalToConstant: 40),
//            habitImageView.heightAnchor.constraint(equalToConstant: 40)
//        ])
    }
    
}

