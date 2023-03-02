json.usr_name @u_name

json.expensesj do
    json.array! @exp.each do |e|
        json.extract! e, :invoice_id ,:desc,:amount,:date,:status,:id
    end
end
