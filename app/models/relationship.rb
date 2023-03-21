class Relationship < ApplicationRecord
  # class_name: "User"でUserモデルを参照
  # followerとfollwedは好きな名前を付けていい
  # 今回はuserから見てfollower（フォローする人）,followed（フォローされる人）とする
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

end
