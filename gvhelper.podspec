#
# Be sure to run `pod lib lint gvhelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'gvhelper'
  s.version          = '0.2.0'
  s.summary          = 'Help Class and Extension'
  s.swift_version    = '4.2'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Help Class and Extension will facilitate development application. Also to development application faster, by using reliable class.'

  s.homepage         = 'https://github.com/princegeovision/gvhelper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'princegeovision' => 'prince.geovision.tw@gmail.com' }
  s.source           = { :git => 'https://github.com/princegeovision/gvhelper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'
  # org: all file in Classes folder.
  # s.source_files = 'gvhelper/Classes/**/*'
  # new: only swift file is included. 
  s.source_files = 'Classes/*.swift', 'objc/*'
  # OS Specific file
  # s.ios.framework = 'gvhelper/Classes/ios/*.swift'
  # All Objective-C Header will be included.
  s.public_header_files = 'objc/*.h'
  
  s.resource_bundles = {
     'gvhelper' => ['Assets/*.png']
  }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # Related Dependency Framework.
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
