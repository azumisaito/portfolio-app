class WorksController < ApplicationController
  
  def index
    @works = Work.all.order(date: "DESC")
  end

  def show
    @work = Work.find(params[:id])
    # TODO:ビューにカテゴリー名の名前だけを入れた配列を返したい
    # @categories = @work.categories.each do |c|
    #   cat = []
    #   cat << c.name
    #   return cat
    # end
  end

end
