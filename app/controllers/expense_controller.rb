class ExpenseController < ApplicationController
    def create
        @cr=Expense.new(
            user_id:params[:user_id],
            invoice_id:params[:invoice_id],
            date:params[:date],
            desc:params[:desc],
            amount:params[:amount],
            status:"In Queue",
            doc:params[:doc]
        )
        chck=apiresponse(@cr.invoice_id)
        if(chck==true)
            if(@cr.save)
                flash.now[:notice]="Expense Added"
                redirect_to "/userpage/#{@cr.user_id}"
            else
                flash.now[:notice]="Try Again"
            end
        else
            @cr.status="Rejected"
            @cr.save
        end

        redirect_to "/userpage/#{@cr.user_id}"

    end
     
    def viewexpense
        @u=User.find(params[:id])
        @exp=Expense.where(user_id: @u.id)
        if(@exp.present?)
            render:viewexpense
        end
    end

    def createpage
        @tid=User.find(params[:id])
    end

    def viewexpenseuser
        @uv=User.find(params[:id])
        @expe=Expense.where(user_id: @uv.id)
        if(@expe.present?)
            render:viewexpenseuser
        end
    end

    def view
        #Rails.logger.info("Parmas #{Expense.find(params[:id])}" )
        @comm_user=User.find(session[:user_id])
        @v=Expense.find(params[:id])
        @comm=Comment.where(expense_id: @v.id)
    end

    def viewuser 
        @comm_user=User.find(session[:user_id])
        @v=Expense.find(params[:id])
        @comm=Comment.where(expense_id: @v.id)
    end

    def approve
        ap=Expense.find(params[:id])
        ap.status="Reimbursed"
        ap.save
        UserMailer.send_expense_approve_mail(ap.invoice_id).deliver_now
        redirect_to "/viewexpense/#{ap.user_id}"
    end

    def reject
        rj=Expense.find(params[:id])
        rj.status="Rejected"
        rj.save
        UserMailer.send_expense_reject_mail(rj.invoice_id).deliver_now
        redirect_to "/viewexpense/#{rj.user_id}"
    end

    def download
        d=Expense.find(params[:id])
        send_file
    end

    def viewdoc
        @vd=Expense.find(params[:id])
         #send_data @vd.doc, :type => 'img/png', :disposition => 'inline'
    end

    def apiresponse(invoicenum)
        require 'net/http'
        api_key ='b490bb80'
        uri='https://my.api.mockaroo.com/invoices.json'
        res=Net::HTTP.post(URI('https://my.api.mockaroo.com/invoices.json'), {"invoice_id" => invoicenum}.to_json, 'X-API-Key' => "b490bb80")
        puts (res.body)
        return JSON.parse(res.body)
        
    end


    def report
        t=User.find(params[:id])
        @rp=Expense.where(user_id: t.id).order('date DESC')
        @sum=Expense.where(user_id: t.id).sum(:amount)
    end
    

end
