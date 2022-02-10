//
//  TextFieldLabelButton+Extension.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 25/09/2021.
//

import UIKit

// MARK: - Extension for viewController keyboard dismissal
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
// MARK: - ... Creating an extension of UIButton
extension UIButton {
  class func makeBlackAndRounded() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 27.5
    button.heightAnchor.constraint(equalToConstant: 55).isActive = true
    button.backgroundColor = AppColors.black.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
    button.titleLabel?.textColor = UIColor(red: 0.969, green: 0.98, blue: 0.988, alpha: 1)
    return button
  }
}

// MARK: - ... Creating an extension of UITextField
extension UITextField {
  class func makePaddedAndBordered() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    textField.leftViewMode = .always
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 25
    textField.backgroundColor = .white
    textField.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 15)
    textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return textField
  }
  class func makeValidationField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isUserInteractionEnabled = false
    textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    textField.textAlignment = .center
    textField.layer.cornerRadius = 20
    textField.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
    textField.layer.borderWidth = 1
    return textField
  }
}

// MARK: - ... Creating an extension of UITextField
extension UILabel {
  class func useFontAndResize() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 15)
    return label
  }
}

// MARK: - ... Enum for holding colors to be used thrioughout the app
enum AppColors {
  case red
  case green
  case white
  case gray
  case black
  case grayedOutButton
  var color: UIColor {
    switch self {
    case .red:
      return UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
    case .green:
      return UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
    case .white:
      return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    case .gray:
      return UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
    case .black:
      return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    case .grayedOutButton:
      return UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    }
  }
}

// MARK: - ... Enum for holding images
enum AppButtonImages {
  case goBackButton
  case goForwardButton
  case closedFocus
  case openFocus
  case consistentSchedule
  case filter
  case happinessLevel
  case home
  case jobStress
  case messageIcon
  case mindJournal
  case playBlack
  case playWhite
  case profileIconBlack
  case profileIconWhite
  case search
  case settings
  case share
  case stressLevel
  case stroke
  case targetAchieved
  case totalMeditationBlack
  case totalMeditationWhite
  case longestSessionIcon
  case mediumProfile
  case achievedIcon
  case iconLongSession
  case decreaseStress
  case increaseHappiness
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
  case meditationfullIcon
  case shareIcon
  case goForwardArrow
  case duration
  case pauseIcon
  case profile
  case preferences
  case notification
  case privacyPolicy
  case contactUs
  case logout
  case passwordIcon
  case emailIcon
  case smallUserIcon
  var image: UIImage {
    switch self {
    case .goBackButton:
      return UIImage(named: "Go-back")!
    case .goForwardButton:
      return UIImage(named: "Go Forward Icon")!
    case .goForwardArrow:
      return UIImage(named: "Go-Forward")!
    case .closedFocus:
      return UIImage(named: "Focus Icon Closed")!
    case .openFocus:
      return UIImage(named: "Focus Icon Open")!
    case .consistentSchedule:
      return UIImage(named: "Consistent Schedule")!
    case .filter:
      return UIImage(named: "Filter")!
    case .happinessLevel:
      return UIImage(named: "Happiness Level")!
    case .home:
      return UIImage(named: "Home Icon")!
    case .jobStress:
      return UIImage(named: "Job-stress")!
    case .messageIcon:
      return UIImage(named: "message-Icon")!
    case .mindJournal:
      return UIImage(named: "Mind-journal")!
    case .playBlack:
      return UIImage(named: "Play Black")!
    case .playWhite:
      return UIImage(named: "Play")!
    case .profileIconBlack:
      return UIImage(named: "Profile Icon")!
    case .profileIconWhite:
      return UIImage(named: "Profile Icon White")!
    case .search:
      return UIImage(named: "Search")!
    case .settings:
      return UIImage(named: "Settings")!
    case .share:
      return UIImage(named: "Share With Friends")!
    case .stressLevel:
      return UIImage(named: "Stress Level")!
    case .stroke:
      return UIImage(named: "Stroke")!
    case .targetAchieved:
      return UIImage(named: "Target Achieved")!
    case .totalMeditationBlack:
      return UIImage(named: "Total Meditation Black")!
    case .totalMeditationWhite:
      return UIImage(named: "Total Meditation White")!
    case .longestSessionIcon:
      return UIImage(named: "LongestSession-Icon")!
    case .mediumProfile:
      return UIImage(named: "Medium-Profile")!
    case .achievedIcon:
      return UIImage(named: "Achieved-Icon")!
    case .iconLongSession:
      return UIImage(named: "Icon-Long-Session")!
    case .decreaseStress:
      return UIImage(named: "DecreaseStress")!
    case .increaseHappiness:
      return UIImage(named: "IncreaseHappiness")!
    case .monday:
      return UIImage(named: "Monday")!
    case .tuesday:
      return UIImage(named: "Tuesday")!
    case .wednesday:
      return UIImage(named: "Wednesday")!
    case .thursday:
      return UIImage(named: "Thursday")!
    case .friday:
      return UIImage(named: "Friday")!
    case .saturday:
      return UIImage(named: "Saturday")!
    case .sunday:
      return UIImage(named: "Sunday")!
    case .meditationfullIcon:
      return UIImage(named: "Meditation-Full-Icon")!
    case .duration:
      return UIImage(named: "duration")!
    case .pauseIcon:
      return UIImage(named: "pause-icon")!
    case .profile:
      return UIImage(named: "Medium-Profile")!
    case .preferences:
      return UIImage(named: "preferences-icon")!
    case .notification:
      return UIImage(named: "notification-icon")!
    case .privacyPolicy:
      return UIImage(named: "privacy-icon")!
    case .contactUs:
      return UIImage(named: "phone-icon")!
    case .logout:
      return UIImage(named: "logout-icon")!
    case .passwordIcon:
        return UIImage(named: "PasswordIcon")!
    case .emailIcon:
        return UIImage(named: "Email-Icon")!
    case .smallUserIcon:
        return UIImage(named: "SmallUser-Icon")!
    case .shareIcon:
      return UIImage(named: "Share-Icon")!
    }
  }
}
// MARK: - ... Enum for holding fonts
enum AppFonts {
  case nunitoSansRegular
  case nunitoSansSemiBold
  case nunitoSansBold
  var font: String {
    switch self {
    case .nunitoSansRegular:
      return "NunitoSans-Regular"
    case .nunitoSansSemiBold:
      return "NunitoSans-SemiBold"
    case .nunitoSansBold:
      return "NunitoSans-Bold"
    }
  }
}

// MARK: - ... Enum for holding string literals for images
enum AppImages {
  case anxietyProblems
  case creativeBlock
  case deepBreathing
  case graph
  case meditationBreak
  case sleepBetter
  case stressfullTimes
  var image: String {
    switch self {
    case .anxietyProblems:
      return "Anxiety Problems"
    case .creativeBlock:
      return "Creative Block"
    case .deepBreathing:
      return "Deep Breathing"
    case .graph:
      return "Graph"
    case .meditationBreak:
      return "Meditation Break"
    case .sleepBetter:
      return "Sleep Better"
    case .stressfullTimes:
      return "Stressfull Times"
    }
  }
}

enum Defaults {
  case signedUp
  case signedIn
  var key: String {
    switch self {
    case .signedUp:
      return "Signed Up"
    case .signedIn:
      return "Signed In"
    }
  }
}

enum AppSounds {
    case birds
    case calmOcean
    case piano
    case relaxingForest
    case waterStream
    case mp3
    
    var resource: String {
        switch self {
        case .birds:
            return "Birds-chirping"
        case .calmOcean:
            return "Calm-ocean-waves"
        case .piano:
            return "Piano-loop"
        case .relaxingForest:
            return "Relaxing-forest-sounds"
        case .waterStream:
            return "Water-stream"
        case .mp3:
            return "mp3"
        }
    }
}
