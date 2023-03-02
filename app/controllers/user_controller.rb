class UserController < ApplicationController
    def signin
        session[:user_id]=nil
    end

    def failed 
    end

    def sign
        @usr=User.find_by(email:params[:email])
        if(@usr.present? && @usr.password==params[:password])
           session[:user_id]=@usr.id 
           if(@usr.u_kind=="admin")
                @isAdmin = true
                @user_id = @usr.id
                render :signin
           else
                @isAdmin = false
                @user_id = @usr.id
                render :signin
           end
        else
            flash[:alert]="Invalid Email or Password"
            redirect_to "/signin"
        end
    end

    def admin
       
            @up=User.all
        
           # flash.now[:notice]="Please Log in"
           
        
    end

    def view 
        @x=User.find(params[:id])
    end
    
    def edit
        @y=User.find(params[:id])
    end

    def pedit
        # @ed=User.find_by(email: params[:email])
        @ed=User.find(params[:id])
        
        @ed.name=params[:name]
        @ed.email=params[:email]
        @ed.department=params[:department]
        @ed.password=params[:password]
        @ed.status=params[:status]

        if(@ed.save)
            redirect_to "/admin"
        end
    end

    def delete
        @del=User.find(params[:id])
        @del.destroy
        redirect_to "/admin"
    end

    def userpage
        @up=User.find(params[:id])
    end
     
    def add
        @ad=User.new(
            name:params[:name],
            email:params[:email],
            department:params[:department],
            password:params[:password],
            status:params[:status],
            u_kind:params[:u_kind]
        )
        if @ad.save
            redirect_to "/admin"
        end
    end

    def logout
        redirect_to "/signin"
    end
     
    def req
    end
     
    def check   
    end

    def searchuser
            @get_u=User.where("name LIKE ?","%#{params[:name]}%")
    end
end
