Tabulous.setup do
  tabs do

    start_tab do
      text          { 'Start' }
      link_path     { root_path }
      visible_when  { user_signed_in? }
      enabled_when  { user_signed_in? }
      active_when   { in_action('index').of_controller('start') }
    end

    start_map_tab do
      text          { 'Map' }
      link_path     { start_map_path }
      visible_when  { user_signed_in? }
      enabled_when  { user_signed_in? }
      active_when   { in_action('map').of_controller('start') }
    end

    ssids_tab do
      text          { 'Ssids' }
      link_path     { ssids_path }
      visible_when  { user_signed_in? }
      enabled_when  { user_signed_in? }
      active_when   { in_action('any').of_controller('ssids') }
    end

    gpspoints_tab do
      text          { 'Gpspoints' }
      link_path     { gpspoints_path }
      visible_when  { user_signed_in? }
      enabled_when  { user_signed_in? }
      active_when   { in_action('any').of_controller('gpspoints') }
    end

    clearalls_tab do
	text		{ 'Clear Data' }
	link_path	{ start_clear_all_path }
	visible_when	{ user_signed_in? }
	enabled_when	{ user_signed_in? }
	active_when	{ in_action('clear_all').of_controller('start') }
    end

    samples_tab do
	text		{ 'Sample Data' }
	link_path	{ start_samples_path }
	visible_when	{ user_signed_in? }
	enabled_when	{ user_signed_in? }
	active_when	{ in_action('samples').of_controller('start') }
    end

    signin_tab do
	text		{ 'Sign In' }
	link_path	{ user_session_path }
	visible_when	{ !user_signed_in? }
	enabled_when	{ true }
	active_when	{ in_action('devise/session#create').of_controller('devise') }
    end

    signup_tab do
	text		{ 'Sign Up' }
	link_path	{ new_user_registration_path }
	visible_when	{ !user_signed_in? }
	enabled_when	{ true }
	active_when	{ in_action('devise/registrations#new').of_controller('devise') }
    end
  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#2C3034'
  #  text_color '#444'
  #  active_tab_color '#fff'
  #  hover_tab_color '#ddd'
  #  inactive_tab_color '#aaa'
  #  inactive_text_color '#888'
  end

end
