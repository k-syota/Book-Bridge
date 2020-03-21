class SearchController < ApplicationController
  def search
  @model = params["search"]["model"]
  @content = params["search"]["content"]
  @method = params["search"]["method"]
  @records = search_for(@model, @content, @method)

  end

private
  def search_for(model, content, method)
    if model == 'book'
      if method == 'perfect'
        Book.where(name: content)
      else method == 'partial'
        Book.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'tag'
      if method == 'perfect'
        Book.where(name: content)
      else method == 'partial'
        Book.where('name LIKE ?', '%'+content+'%')
      end
    end
  end

end