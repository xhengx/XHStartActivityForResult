#
# Be sure to run `pod lib lint XHStartActivityForResult.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XHStartActivityForResult'
  s.version          = '1.0.0'
  s.summary          = '实现android的 startActivityForResult 机制'


  s.description      = <<-DESC
                        实现android的 startActivityForResult 机制,实现回调传值
                       DESC

  s.homepage         = 'https://github.com/xhengx/XHStartActivityForResult'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xhengx' => 'xiaoheng.liu@gmail.com' }
  s.source           = { :git => 'https://github.com/xhengx/XHStartActivityForResult.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'XHStartActivityForResult/**/*.{h,m}'

end
