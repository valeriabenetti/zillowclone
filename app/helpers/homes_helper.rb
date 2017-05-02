module HomesHelper
  def favorited_class(home, user)
    Favorite.find_by(home: home, user: user) ? "favorited" : ""

    # favorite = Favorite.find_by(home: home, user: user)
    #
    # if favorite
    #   "favorited"
    # else
    #   ""
    # end
  end
end
