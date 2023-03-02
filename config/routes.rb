Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "user#signin"
  get "signin" ,to: "user#signin"
  post "signin",to: "user#sign"

  get "/check",to: "user#check"
  get "/failed",to: "user#failed"

  get "/admin",to: "user#admin"
  get "/req",to: "user#req"
  
  #CRUD
  get "/view/:id",to: "user#view"
  get "/edit/:id",to: "user#edit"
  post "/pedit",to: "user#pedit"
  get "/delete/:id",to: "user#delete"
  get "/adduser",to: "user#adduser"
  post "add",to: "user#add"


  get "/userpage/:id",to: "user#userpage"
  get "/logout",to: "user#logout"


  get "/createexp/:id",to: "expense#createpage"
  post "/createexp",to: "expense#create"
  get "/viewexpense/:id",to: "expense#viewexpense"
  get "/viewexpenseuser/:id",to: "expense#viewexpenseuser"
  get "/viewdoc/:id",to: "expense#viewdoc"
  get "/viewexpense/report/:id" ,to: "expense#report"

  get "viewexpense/view/:id",to: "expense#view"
  get "/viewexpense/viewuser/:id",to: "expense#viewuser"

  get "/approve/:id",to: "expense#approve"
  get "/reject/:id",to: "expense#reject"

  post "/addcomment",to: "comment#add"
  get "/commdelete/:id",to: "comment#delete"

  get "/search_user",to: "user#searchuser"



end
