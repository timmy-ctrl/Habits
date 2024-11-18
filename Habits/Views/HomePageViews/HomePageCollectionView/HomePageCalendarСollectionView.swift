import UIKit

final class HomePageCalendarСollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private var dates = [(day: String, date: String, isToday: Bool)]()

    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        super.init(frame: frame, collectionViewLayout: layout)
        setDelegates()
        congifureCollectionView()
        loadDatesForCurrentMonth()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func congifureCollectionView() {
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
//        self.contentInset = .zero
//        self.scrollIndicatorInsets = .zero
        self.register(HomePageCalendarCell.self, forCellWithReuseIdentifier: HomePageCalendarCell.identifier)
    }
    
    private func setDelegates() {
        self.delegate = self
        self.dataSource = self
    }
    
    private func loadDatesForCurrentMonth() {
        dates = []
        
        let calendar = Calendar.current
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"  // Формат для названия дня недели
        
        // Диапазон дней текущего месяца
        guard let range = calendar.range(of: .day, in: .month, for: today) else { return }
        
        // День текущей даты
        let todayDay = calendar.component(.day, from: today)
        
        // Добавляем дни с сегодняшнего дня до конца месяца
        for day in todayDay...range.count {
            var components = calendar.dateComponents([.year, .month], from: today)
            components.day = day
            if let date = calendar.date(from: components) {
                let dayName = dateFormatter.string(from: date).uppercased()
                let dayNumber = "\(day)"
                let isToday = calendar.isDate(date, inSameDayAs: today)
                dates.append((day: dayName, date: dayNumber, isToday: isToday))
            }
        }
        
        // Добавляем дни с начала месяца до вчерашнего дня
        if todayDay > 1 {
            for day in 1..<todayDay {
                var components = calendar.dateComponents([.year, .month], from: today)
                components.day = day
                if let date = calendar.date(from: components) {
                    let dayName = dateFormatter.string(from: date).uppercased()
                    let dayNumber = "\(day)"
                    let isToday = calendar.isDate(date, inSameDayAs: today)
                    dates.append((day: dayName, date: dayNumber, isToday: isToday))
                }
            }
        }
        
        reloadData()
    }
    
    private func scrollToLastItem() {
        guard dates.count > 0 else { return }
        let lastIndexPath = IndexPath(item: dates.count - 1, section: 0)
        scrollToItem(at: lastIndexPath, at: .right, animated: true)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCalendarCell.identifier, for: indexPath) as? HomePageCalendarCell else {
            fatalError("Unable to dequeue HomePageCalendarCell")
        }
        let date = dates[indexPath.item]
        cell.configure(day: date.day, date: date.date, isToday: date.isToday)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
