//
//  TotalMeditationViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit

class TotalMeditationViewController: UIViewController {
  // MARK: - TOP BACK ARROW BUTTON
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - PAGE TITLE LABEL
  let pageTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Total Meditation"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION VIEW
  let totalMeditationView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TOTAL MEDITATION ICON
  let totalMeditationIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.meditationfullIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
    return button
  }()
  // MARK: - TOTAL MEDITATION TIMER LABEL
  let totalMeditationTimerLabel: UILabel = {
    let label = UILabel()
    label.text = "120 hours"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION TEXT LABEL
  let totalMeditationTextLabel: UILabel = {
    let label = UILabel()
    label.text = "You have spent meditating in total \n using our app"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL TIME SECTION LABEL
  let totalTimeSectionLabel: UILabel = {
    let label = UILabel()
    label.text = "Total Time"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION TIME LABEL
  let totalMeditationTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "72 hours"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 18)
    label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - MEDITATION DURATION LABEL
  let meditationDurationLabel: UILabel = {
    let label = UILabel()
    label.text = "Apr 27 - May 03"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - MONDAY GRAPH IMAGE VIEW
  let mondayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.monday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - TUESDAY GRAPH IMAGE VIEW
  let tuesdayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.tuesday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - WEDNESDAY GRAPH IMAGE VIEW
  let wednesdayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.wednesday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - THURSDAY GRAPH IMAGE VIEW
  let thursdayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.thursday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - FRIDAY GRAPH IMAGE VIEW
  let fridayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.friday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - SATURDAY GRAPH IMAGE VIEW
  let saturdayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.saturday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - SUNDAY GRAPH IMAGE VIEW
  let sundayGraphImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppButtonImages.sunday.image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - STATISTICS LABEL
  let statisticsLabel: UILabel = {
    let label = UILabel()
    label.text = "Statistics"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - STRESS LABEL
  let stressLabel: UILabel = {
    let label = UILabel()
    label.text = "Stress Level"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - HAPPINESS LABEL
  let happinessLabel: UILabel = {
    let label = UILabel()
    label.text = "Happiness Level"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - INCREASE STRESS LEVEL ICON
  let increaseStressLevelIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.increaseHappiness.image, for: .normal)
    button.addTarget(self, action: #selector(didTapIncreaseHappinessForwardArrowButton), for: .touchUpInside)
    return button
  }()
  // MARK: - DECREASE STRESS LEVEL ICON
  let decreaseStressLevelIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.decreaseStress.image, for: .normal)
    button.addTarget(self, action: #selector(didTapdecreaseStressForwardArrowButton), for: .touchUpInside)
    return button
  }()
  // MARK: - DECREASE STRESS LEVEL LABEL
  let decreaseStressLevelLabel: UILabel = {
    let label = UILabel()
    label.text = "45% decrease"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - INCREASE HAPPINESS LEVEL LABEL
  let increaseHappinessLevelLabel: UILabel = {
    let label = UILabel()
    label.text = "78% increase"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - DECREASE STRESS FORWARD ICON
  let decreaseStressForwardIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardArrow.image, for: .normal)
    button.addTarget(self, action: #selector(didTapdecreaseStressForwardArrowButton), for: .touchUpInside)
    return button
  }()
  // MARK: - INCREASE HAPPINESS FORWARD ICON
  let increaseHappinessForwardIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardArrow.image, for: .normal)
    button.addTarget(self, action: #selector(didTapIncreaseHappinessForwardArrowButton), for: .touchUpInside)
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    setupConstraintsTotalMeditation()
  }
  // MARK: - DID TAP TOP BACK ARROW BUTTON FUNCTION
  @objc func didTapTopBackArrowButton() {
    if let tabBarController = TabBarViewController() as? UITabBarController {
            tabBarController.selectedIndex = 2
      navigationController?.popViewController(animated: true)
        }
  }
  // MARK: - DECREASE STRESS FORWARD ARROW BUTTON FUNCTIONALITY
  @objc func didTapdecreaseStressForwardArrowButton() {
    let newController = StressLevelViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - FUNCTION
  @objc func didTapIncreaseHappinessForwardArrowButton() {
    let newController = HappinessLevelViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
}
