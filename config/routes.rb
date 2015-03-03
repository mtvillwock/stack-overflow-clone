Rails.application.routes.draw do
  get 'welcome/index'

  resources :questions do
      member do
        put 'upvote'
        put 'downvote'
      end
    resources :answers do
      member do
        put 'upvote'
        put 'downvote'
      end
    end
  end

  root 'questions#index'

end

