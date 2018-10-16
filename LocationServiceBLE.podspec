#
# Be sure to run `pod lib lint LocationServiceBLE.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LocationServiceBLE'
  s.version          = '0.0.3'
  s.summary          = 'LocationServiceBLE exposes location data via Bluetooth'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "LocationServiceBLE exposes server client relation where server - peripheral device advertises its service with characteristics and upon connection with client or central device sends or recieves data depends of characteristic properties."
  

  s.homepage         = 'https://github.com/trajcebg/LocationServiceBLE'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'trajcebg' => 'marko.trajcevic@gmail.com' }
  s.source           = { :git => 'https://github.com/trajcebg/LocationServiceBLE.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'LocationServiceBLE/Classes/**/*'
  s.swift_version = "4.2"
  
  # s.resource_bundles = {
  #   'LocationServiceBLE' => ['LocationServiceBLE/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxCocoa', '~> 4.0'
  
end
