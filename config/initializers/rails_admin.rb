RailsAdmin.config do |config|

  ### Only Admin
  config.authorize_with do |controller|
    redirect_to main_app.authenticated_root_path unless current_user.try(:admin)
  end

  # current user method
  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
