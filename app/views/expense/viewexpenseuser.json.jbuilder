json.array! @expe.each do |e|
json.extract! e, :invoice_id ,:desc,:amount,:date,:status,:id,:user_id
end