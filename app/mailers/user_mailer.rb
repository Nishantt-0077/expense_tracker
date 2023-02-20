class UserMailer < ApplicationMailer
    def send_comment_added_mail
        mail(to: "nishant.tiwari2019@vitstudent.ac.in",from:"culcruzader@gmail.com",subject:"Activity on your Recent Expense",message:"Comment Added")
    end

    def send_expense_approve_mail(exp_id)
        expid_approve=exp_id
        mail(to: "yuvam.arora@go-yubi.com",from:"culcruzader@gmail.com",subject:"Update On Expense Status",message:"Comment Added")
    end

    def send_expense_reject_mail(exp_id)
        exp_id_reject=exp_id
        mail(to: "yuvam.arora@go-yubi.com",from:"culcruzader@gmail.com",subject:"Update On Expense Status",message:"Comment Added")
    end
end
