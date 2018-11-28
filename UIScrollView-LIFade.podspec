Pod::Spec.new do |s|
  s.name             = 'UIScrollView-LIFade'
  s.version          = '1.0.0'
  s.summary          = 'A lightwight, fancy and non-intrusive UIScrollView fade effect category'
  s.description      = <<-DESC
                       - Just one line of code can add a fade effect to any of UIScrollView including its subclass.
                       - Support horizontal, vertical or both.
                       - Non-intrusive, no need to subclass it.
                       DESC
  s.social_media_url = 'https://lihkg.com'
  s.homepage         = 'https://github.com/lihkg/UIScrollView-LIFade'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lihkg-foresight' => 'git4sight@gmail.com' }
  s.source           = { :git => 'https://github.com/lihkg/UIScrollView-LIFade.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'UIScrollView-LIFade/*.{h,m}'
  s.public_header_files = 'UIScrollView-LIFade/**/*.{h}'
end
