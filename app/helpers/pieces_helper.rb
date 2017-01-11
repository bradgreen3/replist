module PiecesHelper

  def authed_user_no_vid(presenter)
    presenter.piece.yt_link == "" && presenter.user == current_user && presenter.yt_users.exists?(user_id: current_user.id)
  end

  def authed_user_vid(presenter)
    presenter.piece.yt_link != "" && presenter.user == current_user && presenter.yt_users.exists?(user_id: current_user.id)
  end

  def nonauthed_user_vid(presenter)
    presenter.piece.yt_link == "" && presenter.user == current_user && !presenter.yt_users.exists?(user_id: current_user.id)
  end

  def authed_user_other_vid(presenter)
    presenter.piece.yt_link != "" && current_user && presenter.yt_users.exists?(user_id: current_user.id)
  end

  def nonauthed_user_other_vid(presenter)
    presenter.piece.yt_link != "" && current_user && !presenter.yt_users.exists?(user_id: current_user.id)
  end

end
