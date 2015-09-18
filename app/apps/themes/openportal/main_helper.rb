module Themes::Openportal::MainHelper
  def self.included(klass)
    klass.helper_method [:openportal_first_list_select] rescue "" # here your methods accessible from views
  end

  def openportal_settings(theme)
    # here your code on save settings for current site, by default params[:theme_fields] is auto saved into theme
    # Also, you can save your extra values added in admin/settings.html.erb
    # sample: theme.set_meta("my_key", params[:my_value])
  end
  
    # return a list of options for "Recent items from " on site settings -> theme settings
  def openportal_first_list_select
    res = []
    current_site.the_post_types.decorate.each {|p| res << "<option value='#{p.the_slug}'>#{p.the_title}</option>" }
    res.join("").html_safe
  end

  def openportal_on_install_theme(theme)
    group = theme.add_field_group({name: "Home Page", slug: "home_page"})
    group.add_field({"name"=>"Home Page", "slug"=>"home_page", description: "Select your home page"},{field_key: "posts", post_types: "all"})
    group.add_field({"name"=>"Recent items from", "slug"=>"recent_post_type"}, {field_key: "select_eval", command: "openportal_first_list_select"})
    group.add_field({"name"=>"Maximum of items", "slug"=>"home_qty"}, {field_key: "numeric", default_value: 6})

    group = theme.add_field_group({name: "Icon Section", slug: "icon_section"})
    group.add_field({"name"=>"Title Column Left", "slug"=>"title_icon_section_left"}, {field_key: "editor", translate: true, default_value: "Speeds up development"})
    group.add_field({"name"=>"Column Left", "slug"=>"icon_section_left"}, {field_key: "editor", translate: true, default_value: "Lo sviluppo condiviso e lo scambio di informazioni velocizza e migliora la realizzazione dei servizi."})
    group.add_field({"name"=>"Title Column Center", "slug"=>"title_icon_section_center"}, {field_key: "editor", translate: true, default_value: "User Experience Focused"})
    group.add_field({"name"=>"Column Center", "slug"=>"icon_section_center"}, {field_key: "editor", translate: true, default_value: "Mettere al centro l'esperienza d'uso dell'utilizzatore con in mente sempre accessibilità, usabilità e innovazione."})
    group.add_field({"name"=>"Title Column Right", "slug"=>"title_icon_section_right"}, {field_key: "editor", translate: true, default_value: "Increase security"})
    group.add_field({"name"=>"Column Right", "slug"=>"icon_section_right"}, {field_key: "editor", translate: true, default_value: "La condivisione diventa un potente mezzo per aumentare la sicurezza delle applicazioni."})

    group = theme.add_field_group({name: "Footer", slug: "footer"})
    group.add_field({"name"=>"Column Left", "slug"=>"footer_left"}, {field_key: "editor", translate: true, default_value: "<h5>Lombardia Informatica</h5><p>Via T.Taramelli, 26 - 20124 MILANO<br>Tel 02 39331.1 - Fax 02 39331.250<br> Milano, Italia. </p>"})
    group.add_field({"name"=>"Column Center", "slug"=>"footer_center"}, {field_key: "editor", translate: true, default_value: "<h5>Links</h5> <p><a href='http://www.lispa.it'>Sito Lispa</a><br> <a href='https://www.linkedin.com/company/lombardia-informatica'>Linkedin</a><br> <a href='https://www.facebook.com/LombardiaInformatica'>Facebook</a></p>"})
    group.add_field({"name"=>"Column Right", "slug"=>"footer_right"}, {field_key: "editor", translate: true, default_value: "<h5>About</h5><p>OpenPortal è un Portale aperto <br> per lo sviluppo collaborativo e cooperativo <br> dei servizi software.</p>"})
    
    unless theme.get_field_groups.where(slug: "fields").any?
      group = theme.add_field_group({name: "Main Settings", slug: "fields", description: ""})
      group.add_field({"name"=>"Background color", "slug"=>"bg_color"},{field_key: "colorpicker"})
      group.add_field({"name"=>"Links color", "slug"=>"links_color"},{field_key: "colorpicker"})
      group.add_field({"name"=>"Backgroun image", "slug"=>"bg"},{field_key: "image"})
    end
    theme.set_meta("installed_at", Time.now.to_s) # save a custom value
  end

  def openportal_on_uninstall_theme(theme)
    theme.destroy
  end
end