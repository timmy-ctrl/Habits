import UIKit

class HabitTrackerView: UIView {
    
    private let daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    private var circleViews: [UIView] = []
    private var labels: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        
        // Добавляем метку "Habit Frequency"
        let habitFrequencyLabel = UILabel()
        habitFrequencyLabel.text = "Habit Frequency"
        habitFrequencyLabel.font = UIFont.boldSystemFont(ofSize: 16)
        habitFrequencyLabel.textAlignment = .center
        
        // Создаем стек для дней недели и иконок
        let daysStackView = UIStackView()
        daysStackView.axis = .vertical
        daysStackView.spacing = 10
        daysStackView.alignment = .center
        
        for day in daysOfWeek {
            let label = UILabel()
            label.text = day
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 12)
            labels.append(label)
            
            let circleView = UIView()
            circleView.layer.cornerRadius = 15
            circleView.layer.borderWidth = 1
            circleView.layer.borderColor = UIColor.lightGray.cgColor
            circleView.translatesAutoresizingMaskIntoConstraints = false
            circleView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            circleView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            circleViews.append(circleView)
            
            let dayStackView = UIStackView(arrangedSubviews: [label, circleView])
            dayStackView.axis = .vertical
            dayStackView.spacing = 5
            dayStackView.alignment = .center
            
            daysStackView.addArrangedSubview(dayStackView)
        }
        
        // Добавляем метку "Custom"
        let customLabel = UILabel()
        customLabel.text = "Custom"
        customLabel.font = UIFont.systemFont(ofSize: 16)
        customLabel.textAlignment = .center
        
        mainStackView.addArrangedSubview(habitFrequencyLabel)
        mainStackView.addArrangedSubview(daysStackView)
        mainStackView.addArrangedSubview(customLabel)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func updateCircles(frequencies: [Int]) {
        for (index, frequency) in frequencies.enumerated() {
            if index < circleViews.count {
                let colorLayer = getColorLayer(for: frequency)
                circleViews[index].layer.sublayers?.forEach { $0.removeFromSuperlayer() }
                if let colorLayer = colorLayer {
                    circleViews[index].layer.addSublayer(colorLayer)
                }
            }
        }
    }
    
    private func getColorLayer(for frequency: Int) -> CALayer? {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        layer.cornerRadius = 15
        
        switch frequency {
        case 0:
            return nil
        case 1:
            let halfLayer = CALayer()
            halfLayer.frame = CGRect(x: 0, y: 15, width: 30, height: 15)
            halfLayer.backgroundColor = UIColor.yellow.cgColor
            layer.addSublayer(halfLayer)
        case 2:
            layer.backgroundColor = UIColor.green.cgColor
        default:
            return nil
        }
        
        return layer
    }
}
