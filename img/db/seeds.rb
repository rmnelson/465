User.create!([
  {email: "ryan@rnelnet.com", encrypted_password: "$2a$10$nY5PQBMYUPFx8Tgus7PxiuNMaRe50uNcts6ls.HjWiHMR0.TmPMEC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2014-11-15 23:33:13", last_sign_in_at: "2014-11-15 23:29:02", current_sign_in_ip: "24.7.165.67", last_sign_in_ip: "24.7.165.67", name: "ryan"},
  {email: "bob@rnelnet.com", encrypted_password: "$2a$10$Ddw4fQV.othjyhuPhJzfVuW.7JolPqS4UxwWx4aOfb4rXvLEoLLfS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2014-11-15 23:32:41", last_sign_in_at: "2014-11-15 23:30:09", current_sign_in_ip: "24.7.165.67", last_sign_in_ip: "24.7.165.67", name: "bob"}
])
Acl.create!([
  {image_id: 4, user_id: 1}
])
Image.create!([
  {filename: "1_25108_1415754358240.jpg", private: false, user_id: 1},
  {filename: "1_98797_1415753047059.jpg", private: false, user_id: 1},
  {filename: "1_12099_1415754938058.jpg", private: true, user_id: 1},
  {filename: "2_40046_1415753280509.jpg", private: true, user_id: 2},
  {filename: "2_16565_1415754379928.jpg", private: false, user_id: 2},
  {filename: "2_46086_1416092251291.jpg", private: false, user_id: 2}
])
Tag.create!([
  {tag_string: "Poo bear! No!!!", image_id: 6},
  {tag_string: "Is that Andy Dick?", image_id: 2},
  {tag_string: "Looks like its a dick!", image_id: 2},
  {tag_string: "profane", image_id: 4}
])
