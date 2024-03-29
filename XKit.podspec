#
# Be sure to run `pod lib lint XKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XKit'
  s.version          = '1.0.25'
  s.summary          = 'iOS OC 常用方法总结.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS 中 Objective-C 项目中常用的方法总结.
                       DESC

  s.homepage         = 'https://github.com/willzh/XKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'willzh' => 'zworrks@163.com' }
  s.source           = { :git => 'https://github.com/willzh/XKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'XKit/Classes/**/*'
  
  
  #子目录 自定义UI
  s.subspec 'CustomUI' do |cus|
      cus.source_files = 'XKit/Classes/CustomUI/**/*'
      #cus.dependency 'XKit/Extensions'
      #cus.dependency 'XKit/Manager'
  end
  
  
  # s.resource_bundles = {
  #   'XKit' => ['XKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
