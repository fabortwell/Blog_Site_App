# class UserSerializer < ActiveModel::Serializer
#   attributes :username, :avatar, :bio
# end


class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :password_digest
end
