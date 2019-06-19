#
# Be sure to run `pod lib lint RxCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxCell'
  s.version          = '0.2.0'
  s.summary          = 'RxSwift extensions on UITableViewCell and UICollectionViewCell.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Adds rx.reuseDisposeBag property for UITableViewCell and UICollectionViewCell like a NSObject-Rx adds rx.disposeBag for NSObject.
                       DESC

  s.homepage         = 'https://github.com/tr1ckyf0x/RxCell'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vladislav Lisyanskiy' => 'vladislav.lisyanskiy@gmail.com' }
  s.source           = { :git => 'https://github.com/tr1ckyf0x/RxCell.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'
  s.source_files = 'RxCell/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RxCell' => ['RxCell/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'RxSwift', '~> 5'
end
