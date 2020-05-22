Pod::Spec.new do |s|
  s.name         = "XZUtilsKit"
  s.version      = "0.1.2"
  s.summary      = "custem tool. summary"
  s.description  = "custem tool description"
  s.homepage     = "https://github.com/LikeOrchid/XZUtilsKit"
  s.social_media_url   = "https://blog.csdn.net/qq_27969455"
  s.license= { :type => "MIT", :file => "LICENSE" }
  s.author       = { "xz" => "1476529217@qq.com" }
  s.source       = { :git => "https://github.com/LikeOrchid/XZUtilsKit.git", :tag => s.version }
  s.source_files = "XZUtilsKit/**/*.{h,m}"
  s.ios.deployment_target = '6.0'
  s.frameworks   = 'UIKit'
  s.requires_arc = true

end