authorization do
  role :user do
    has_permission_on :activity_feeds, to: [:index]
    has_permission_on :signups, to: %i[index show update]
    has_permission_on :play, to: [:index]

    has_permission_on :match_requests, to: %i[new show create]
    # Only allows users to edit their own match request
    has_permission_on :match_requests, to: %i[edit update destroy] do
      if_attribute user_id: is { user.id }
    end

    has_permission_on :match_request_responses, to: [:create]
    # Only allows users to edit their own match request
    has_permission_on :match_request_responses, to: [:destroy] do
      if_attribute user_id: is { user.id }
    end
  end

  role :guest do
    has_permission_on :static_pages, to: [:home]
    has_permission_on :sessions, to: [:create]
  end

  role :admin do
    # I needed to add a admin_ to the controller names because the admin controllers are namespaced
    # under Admin, e.g. Admin::EntityExtractionsController.
    has_permission_on :admin_clubs, to: :manage
    has_permission_on :admin_matches, to: :manage
    has_permission_on :admin_match_requests, to: :manage
    has_permission_on :admin_match_request_responses, to: :manage
    has_permission_on :admin_roles, to: :manage
    has_permission_on :admin_user_role_mappings, to: :manage
    has_permission_on :admin_users, to: :manage
  end
end

privileges do
  privilege :manage, includes: %i[index show create destroy update edit]
end
