Pod::Spec.new do |spec|
spec.name                  = 'ZRPopoverView'
spec.version               = '1.3'
spec.license               = 'MIT'
spec.homepage              = 'https://github.com/VictorZhang2014/ZRPopoverView'
spec.author                = { 'Victor Zhang' => 'victorzhangq@gmail.com' }
spec.summary               = 'ZRPopoverView is a popover view that pop UIView with a list of button by customising.'
spec.source                = { :git => 'https://github.com/VictorZhang2014/ZRPopoverView.git', :tag => spec.version }
spec.requires_arc          = true
spec.platform              = :ios
spec.ios.deployment_target = '7.0'

spec.public_header_files   = 'Classes/*.{h}'
spec.source_files          = 'Classes/*.{h,m}'
spec.frameworks            = 'UIKit'

end
