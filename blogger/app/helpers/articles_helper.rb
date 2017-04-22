module ArticlesHelper

  def article_params
    return params.require(:article).permit(:title, :body, :tag_list);
  end
end
