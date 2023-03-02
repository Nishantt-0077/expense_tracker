json.invoice_id @v.invoice_id
json.date @v.date
json.amount @v.amount
json.desc @v.desc
json.status @v.status
json.id @v.id

json.comments do
    json.array! @comm.each do |c|
    json.extract! c, :expense_id ,:user_name,:desc
    end
end
