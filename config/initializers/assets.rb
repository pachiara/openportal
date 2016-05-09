# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

if Rails.env.production?
  Rails.application.config.assets.precompile =  [ '*.js', '_variables.scss', '*.css.scss' ]
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/admin-basic-manifest.css )
  Rails.application.config.assets.precompile += %w( camaleon_cms/camaleon.png )
  Rails.application.config.assets.precompile += %w( camaleon_cms/favicon.ico )
  Rails.application.config.assets.precompile += %w( themes/openportal/assets/css/main.css )
  Rails.application.config.assets.precompile += %w( themes/openportal/assets/images/en.png )
  Rails.application.config.assets.precompile += %w( themes/openportal/assets/images/it.png )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/intro/menus.png )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/admin-manifest.css )
  Rails.application.config.assets.precompile += %w( camaleon_cms/image-not-found.png )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/img/no_image.jpg )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/colorpicker.css )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/cropper/cropper.min.css )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/nestable/jquery.nestable.css )
  Rails.application.config.assets.precompile += %w( camaleon_cms/admin/nav-menu.css )
end
