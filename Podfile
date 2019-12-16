ENV['SWIFT_VERSION'] = '5'

platform :ios, '11.0'
use_frameworks!


def shared_pods
  pod 'TableKit'
  pod 'Autofiller', :path => '.'
end

target 'AutofillerExamples' do
  shared_pods
end

target 'AutofillerTests' do
  shared_pods
  pod 'iOSSnapshotTestCase'
end
