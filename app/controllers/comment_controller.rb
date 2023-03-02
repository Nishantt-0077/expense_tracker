class CommentController < ApplicationController
    def add
        if(params[:desc]!="")
            usr=User.find(params[:user_id])
            cm=Comment.create(
                expense_id:params[:expense_id],
                user_name: usr.name,
                desc:params[:desc]
            )
            us=User.find(params[:user_id])
            exp_f=Expense.find(cm.expense_id)
            usr=User.find(exp_f.user_id)
            if(us.u_kind=="admin")
                cm.user_name="Admin" 
                UserMailer.send_comment_added_mail(usr.email,cm.desc).deliver_now
            end
            # redirect_to "/view/viewexpense/view/#{cm.expense_id}"
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
