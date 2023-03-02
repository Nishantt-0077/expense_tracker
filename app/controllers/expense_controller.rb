class ExpenseController < ApplicationController
    def create
        @cr=Expense.new()
            @cr.user_id=params[:user_id]
            @cr.invoice_id=params[:invoice_id]
            @cr.date=params[:date]
            @cr.desc=params[:desc]
            @cr.amount=params[:amount]
            @cr.status="In Queue"
            @cr.document=params[:doc]
        
        chck=apiresponse(params[:invoice_id].to_i)
        puts params[:invoice_id]
        puts chck
        if(chck["status"])
            @cr.status="In Queue"
            @cr.save
            redirect_to "/userpage/#{@cr.user_id}"
        else
            @cr.status="Rejected by Invoice System"
            @cr.save
            redirect_to "/userpage/#{@cr.user_id}"
        end

        

    end
     
    def viewexpense
        @u=User.find(params[:id])
        @u_name=@u.name
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
        # @comm_user=User.find(session[:user_id])
        @v=Expense.find(params[:id])
        @comm=Comment.where(expense_id: @v.id)
    end

    def approve
        ap=Expense.find(params[:id])
        usr=User.find(ap.user_id)
        ap.status="Reimbursed"
        ap.save
        UserMailer.send_expense_approve_mail(ap.invoice_id,usr.email).deliver_now
        redirect_to "/viewexpense/#{ap.user_id}"
    end

    def reject
        rj=Expense.find(params[:id])
        usr=User.find(rj.user_id)
        rj.status="Rejected"
        rj.save
        UserMailer.send_expense_reject_mail(rj.invoice_id,usr.email).deliver_now
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

    def apiresponse(invoice_id)
        require 'net/http'
        api_key ='b490bb80'
        uri='https://my.api.mockaroo.com/invoices.json'
        res=Net::HTTP.post URI('https://my.api.mockaroo.com/invoices.json'), {"invoice_id" => invoice_id}.to_json, 'X-API-Key' => "b490bb80"
        return JSON.parse(res.body)
        
    end


    def report
        t=User.find(params[:id])
        @rp=Expense.where(user_id: t.id).order('date DESC')
        @sum=Expense.where(user_id: t.id).sum(:amount)
    end
    

end
