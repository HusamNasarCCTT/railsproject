module ArticlesHelper

  def article_params
    return params.require(:article).permit(:title, :body);
  end
end
