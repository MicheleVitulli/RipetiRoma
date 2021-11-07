json.extract! teacher, :id, :f_name, :l_name, :email, :phone, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
