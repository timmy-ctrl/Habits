import UIKit

final class HabitFrequencyModel {
    
    private let daysArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    func day(for index: Int) -> String {
        return daysArray[index]
    }
    
    func image(for index: Int) -> UIImage {
        if index == 1 || index == 2 || index == 4 {
            return AssetImages.halffillshape.image!
        } else {
            return AssetImages.shapefill.image!
        }
    }
    
    var numberOfDays: Int {
        return daysArray.count
    }
}
