module LikesHelper
  def count(comment)
    l=0
    d=0
    comment.likes.each do |a|
      if a.dislike.blank?
        l=l+1
      else
        d=d+1
      end
    end
    return l,d
  end
end
