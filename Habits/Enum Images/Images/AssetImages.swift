import UIKit

enum AssetImages: String {
    case background
    case facebook
    case google
    case letter
    case lock
    case loupe
    case billboardImage
    case homePageBackground
    case plus
    case addhabit
    case arrow
    case facebillboard
    case completed
    case addhabitplus
    case alarmoff
    case shapefill
    case halffillshape
    case backarray
    case habit
    case bell
    case repeatImage
    case Introductionimg1
    case Introductionimg2
    case Introductionimg3
    case Introductionimg4
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
