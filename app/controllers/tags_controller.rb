class TagsController < ApplicationController
  before_action :set_tag, only: %i[ edit update destroy ]

  def index
    @tags = current_user.tags.ordered
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = current_user.tags.new(tag_params)

    if @tag.save
      redirect_to tags_path, notice: "Tag was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "Tag was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy!
    redirect_to tags_path, status: :see_other, notice: "Tag was successfully deleted."
  end

  private

  def set_tag
    @tag = current_user.tags.find(params.expect(:id))
  end

  def tag_params
    params.expect(tag: [ :name ])
  end
end
