Tabulous.setup do

  tabs do

    posts_tab do
      text          { 'Blogg' }
      link_path     { posts_path}
      visible_when  { true }
      enabled_when  { true }
      a_subtab_is_active { true }
      active_when   { in_action('any').of_controller('posts') }
    end

    comments_subtab do
      text          { 'Kommentarer' }
      link_path     { comments_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('comments') }
    end

    categories_subtab do
      text          { 'Kategorier' }
      link_path     { categories_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('categories') }
    end

    camps_tab do
      text          { 'Kurs' }
      link_path     { camps_path }
      visible_when  { true }
      enabled_when  { true }
      a_subtab_is_active { true }
      active_when   { in_action('any').of_controller('camps') }
    end

    registrations_subtab do
      text          { 'Påmeldinger' }
      link_path     { registrations_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('registrations') }
    end

    contacts_subtab do
      text          { 'Kontakter' }
      link_path     { contacts_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('contacts') }
    end

    products_subtab do
      text          { 'Produkter' }
      link_path     { products_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('products') }
    end

    invoices_subtab do
      text          { 'Faktura' }
      link_path     { invoices_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_actions('index', 'show', 'all_invoices').of_controller('invoices') }
    end

    totals_subtab do
      text          { 'Regnskap' }
      link_path     { totals_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('totals').of_controller('invoices') }
    end

    home_tab do
      text          { 'Hjem' }
      link_path     { cms_path }
      visible_when  { true }
      enabled_when  { true }
      a_subtab_is_active { true }
      active_when   { in_action('index').of_controller('home') }
    end

    users_subtab do
      text          { 'Bruker' }
      link_path     { users_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('users') }
    end

    options_subtab do
      text          { 'Innstillinger' }
      link_path     { options_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('options') }
    end

    data_files_subtab do
      text          { 'Bilder' }
      link_path     { data_files_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('data_files') }
    end

    pages_subtab do
      text          { 'Sider' }
      link_path     { pages_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('pages') }
    end
  #
  # customize do
  #
  #   # which class to use to generate HTML
  #   # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
  #   # or create your own renderer class and reference it here
  #   # renderer :default
  #
  #   # whether to allow the active tab to be clicked
  #   # defaults to true
  #   # active_tab_clickable true
  #
  #   # what to do when there is no active tab for the current controller action
  #   # :render -- draw the tabset, even though no tab is active
  #   # :do_not_render -- do not draw the tabset
  #   # :raise_error -- raise an error
  #   # defaults to :do_not_render
  #   # when_action_has_no_tab :do_not_render
  #
  #   # whether to always add the HTML markup for subtabs, even if empty
  #   # defaults to false
  #   # render_subtabs_when_empty false
  #
  # end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  # use_css_scaffolding do
  #   background_color '#ccc'
  #   text_color '#444'
  #   active_tab_color '#fff'
  #   hover_tab_color '#ddd'
  #   inactive_tab_color '#aaa'
  #   inactive_text_color '#888'
  end

end
