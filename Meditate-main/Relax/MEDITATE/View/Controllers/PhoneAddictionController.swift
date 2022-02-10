//
//  PhoneAddictionController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 02/11/2021.
//

import UIKit
import AVFoundation

class PhoneAddictionController: UIViewController {
    var audioPlayer: AVAudioPlayer?

  // MARK: - Button to go back to the previous view controller
  let backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(AppButtonImages.goBackButton.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    return button
  }()
  // MARK: - name of the session
  lazy var sessionNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Phone addiction"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - setting pause icon image on button
  lazy var pauseIcon: UIButton = {
    let button = UIButton()
    button.setImage(AppButtonImages.longestSessionIcon.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(playSong), for: .touchUpInside)
    return button
  }()
    let urlString = Bundle.main.path(forResource: AppSounds.relaxingForest.resource, ofType: AppSounds.mp3.resource)
    @objc func playSong() {
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
            // stop playback
            pauseIcon.setImage(AppButtonImages.longestSessionIcon.image, for: .normal)
            audioPlayer.pause()
        } else {
            // set up player and play
            pauseIcon.setImage(AppButtonImages.pauseIcon.image, for: .normal)
                do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                 guard let urlString = urlString else { return }
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

                guard let audioPlayer = audioPlayer else {
                    return
                }
                audioPlayer.play()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

  // MARK: - setting stroke icon image on button
  lazy var strokeIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Session-Stroke"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(playSong), for: .touchUpInside)
    return button
  }()
  // MARK: - time description label
  lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.text = "2:35"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 25)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - button to go back to previous view controller
  @objc func backButtonPressed() {
    navigationController?.popViewController(animated: true)
  }
  // MARK: - FUNCTION VIEW DID LOAD
  override func viewDidLoad() {
    super.viewDidLoad()
    constraintViews()
  }
  // MARK: - function to add all subview to view
  func addDefaultViews() {
    view.addSubview(backButton)
    view.addSubview(sessionNameLabel)
    view.addSubview(pauseIcon)
    view.addSubview(strokeIcon)
    view.addSubview(timeLabel)
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
  }
  // MARK: - function to constrian all sub view
  func constraintViews() {
    addDefaultViews()
    self.navigationItem.setHidesBackButton(true, animated: true)
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
      backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      backButton.heightAnchor.constraint(equalToConstant: 28),
      backButton.widthAnchor.constraint(equalToConstant: 28),
      sessionNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      sessionNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
      strokeIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      strokeIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
      pauseIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      pauseIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -12),
      timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 180)
    ])
  }
}

