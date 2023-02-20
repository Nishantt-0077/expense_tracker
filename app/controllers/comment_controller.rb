class CommentController < ApplicationController
    def add
        if(params[:desc]!="")
            cm=Comment.create(
                expense_id:params[:expense_id],
                user_name: params[:user_name],
                desc:params[:desc]
            )
            us=User.find(session[:user_id])
            if(us.u_kind=="admin") 
                UserMailer.send_comment_added_mail.deliver_now
            end
            redirect_to "/view/viewexpense/view/#{cm.expense_id}"
         end
    end

    def delete
        cmmn=Comment.find(params[:id])
        if(cmmn.present?)
            temp=cmmn.expense_id
            cmmn.destroy
            redirect_to "/viewexpense/view/#{temp}"
        end
    end
end
