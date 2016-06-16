#
# Be sure to run `pod lib lint LLAButton.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LLAButton"
  s.version          = "0.2.0"
  s.summary          = "A delightful subclass of UIButton."
  s.description      = <<-DESC
                       A UIButton subclass that supports setting colors for different states.
                       DESC
  s.homepage         = "https://github.com/lipka/LLAButton"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Lukas Lipka" => "lukaslipka@gmail.com" }
  s.source           = { :git => "https://github.com/lipka/LLAButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lipec'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
