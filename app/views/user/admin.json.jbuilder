json.array! @up.each do |user|
json.extract! user, :id ,:name,:status,:department,:email,:u_kind
end