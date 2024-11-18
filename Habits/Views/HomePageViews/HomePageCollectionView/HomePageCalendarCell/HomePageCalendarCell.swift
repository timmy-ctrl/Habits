import UIKit

final class HomePageCalendarCell: UICollectionViewCell {
    
    static let identifier = "HomePageCalendarCell"
    
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.middleFont()
        dayLabel.textColor = UIColor.customColor
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        return dayLabel
    }()
    
    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.middleFont()
        dateLabel.textColor = UIColor.black
        dateLabel.font = .systemFont(ofSize: 20, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        configureDayLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(day: String, date: String, isToday: Bool) {
        dayLabel.text = day
        dateLabel.text = date
        if isToday {
            contentView.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.2)
            dateLabel.textColor = UIColor.systemBlue
        } else {
            contentView.backgroundColor = .white
            dateLabel.textColor = .black
        }
    }
}


//MARK: - Setup UI
extension HomePageCalendarCell {
    private func configureDayLabel() {
        contentView.addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    private func configureDateLabel() {
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 2)
        ])
    }
}
